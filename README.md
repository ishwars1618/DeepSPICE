# DeepSPICE: Accelerating Digital Cell Characterization Using Deep Learning (2022)

I created the DeepSPICE methodology to accelerate the computation of delays for all input event combinations in a given standard cell (the transistor-based physical implementation of a boolean function). I do this by training a Deep Neural Network (DNN) on a subset of input event combinations, and evaluating delays using the DNN for the remaining input event combinations.

## How to run

**Instructions:**
* Open `ML-22-03-02.ipynb`
* Set the cell characterization parameters in the first Jupyter notebook cell
    * gate_name: the name of the standard cell you want to characterize (see [Directory structure](#directory-structure))
    * input_num: the number of inputs this standard cell has
    * VHIGH: the voltage representing a boolean $1$.
    * threshold: the voltage at a standard cell's output node should cross VHIGH $\times$ threshold to be considered a 1, and vice versa cross VHIGH $\times$ (1-threshold) to be considered a 0. This is used to determine the propagation delay from inputs switching to output switching in a standard cell.
    * input_delays: the list of slew values that the cell is characterized over. The model is trained over these different slews
* Run all cells from top to bottom.

**Required packages:**
* Tensorflow, Keras
* NumPy
* Pandas
* scikit-learn
* Matplotlib

## Directory structure

The standard cells and their corresponding boolean functions that this work was tested on are denoted using the nomenclature 'NtoM_V', where N is the number of input event combinations that cause the output to rise, M is the number of input event combinations that cause the output to fall, and V is the version number (as there can be different boolean functions with the same N and M). For example, 59TO69_1 is a standard cell where 59 input event combinations cause the output to rise and 69 input event combinations cause the output to fall. The NAND and NOR standard cells are labeled with their original names `NAND` and `NOR`.

This notation makes it easy to identify how many total input event combinations result in output transitions, as the goal of this work is to provide an acceleration benefit when this count is large.

Here's the directory structure:

* `ML-22-03-02.ipynb`: this is the DeepSPICE experiment. It compares the baseline approach of running simulations for all input event combinations with the DeepSPICE approach of simulating a subset of input event combinations, training an ML model on those, and performing inference on the rest using the model.
* `program-segments/netlists`: for each of the standard cells used as test cases in DeepSPICE, this directory contains the corresponding:
    * list of input event combinations resulting in an output transition (`NtoM_V.in`)
    * boolean function in Python (`NtoM_V.py`)
    * lines in the SPICE language instantiating it as a CMOS circuit (`NtoM_V.sp`)
* `simulation-programs`: contains all SPICE files run for this research. `ML-22-03-02.ipynb` orchestrates the creation of these SPICE files, which are used to simulate many different standard cells fed with many different input event combinations, by concatenating lines of the SPICE language found in the `program-segments` directory. 
    * Please unzip `simulation-programs.zip` to get the full directory.
* `simulation-output`: contains the results of simulating all the SPICE files in `simulation-programs`
    * Please unzip `simulation-output.zip` to get the full directory
* `DNN-results-T{k}-{P}`: for trial number $k$ and train-to-test ratio $P : 100-P$, this directory contains the results of the DeepSPICE method compared to the baseline method for all standard cells, reporting train & test accuracy and time taken.
    * For the **training** set, I used 25% and 30% of the input event combinations for each cell  ... not 75% and 70%.
