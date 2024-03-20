# Setup and connect
source setup.sh
# Username and account for login:
ssh -X cc01group3@10.28.8.71
cc01group3
# Add license
source /home/share_file/cadence/add_path
source /home/share_file/cadence/add_license
# Work
## Lab 1
cd /home/cc01group3/vlsi/2152147/work/simulation_env
xrun -access rw -licqueue -64BIT -l run.log lab1.v lab1_tb.v
simvision -64 &

## Lab 2
cd /home/cc01group3/vlsi/2152147/work/synthesis_env
### where to put code :
cd /home/cc01group3/vlsi/2152147/work/synthesis_env/Genus_BoundFlasher/RTL

