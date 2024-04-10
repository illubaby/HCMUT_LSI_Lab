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

xrun -access rw -licqueue -64BIT -l run.log bounce_flash.v bounce_flash_tb.v
simvision -64 &

## Lab 2
### where to put code or modify:
cd /home/cc01group3/vlsi/2152147/work/synthesis_env/Genus_BoundFlasher/RTL
### Edit config 
cd /home/cc01group3/vlsi/2152147/work/synthesis_env
vi ./Genus_BoundFlasher/constraints/bound_flasher_gate.sdc
vi ./Genus_BoundFlasher/LAB1/run.tcl
### Run 
cd /home/cc01group3/vlsi/2152147/work/synthesis_env/Genus_BoundFlasher/LAB1
genus -f run.tcl | tee -i sync.log

### Check Synthesis Report
vi reports_Mar22-15:45:12/final_qor.rpt
vi reports_Mar22-15:45:12/final_area.rpt
vi reports_Mar22-15:45:12/final_time.rpt
###  Invoke NETLIST Schematic Window
genus -f gui.tcl -gui
<<<<<<< Updated upstream

##Lab 3
cd /home/cc01group3/vlsi/2152147/work/lec_env
ln -sf /home/cc01group3/vlsi/2152147/work/synthesis_env/Genus_BoundFlasher/RTL/bounce_flash.v /home/cc01group3/vlsi/2152147/work/lec_env/
ln -sf /home/cc01group3/vlsi/2152147/work/synthesis_env/Genus_BoundFlasher/LAB1/outputs_Apr04-22:27:50/Bounce_flash_m.v
ln -sf /home/cc01group3/vlsi/2152147/work/synthesis_env/Genus_BoundFlasher/LIB/slow.lib 
### Perform LEC with Conformal
cd /home/cc01group3/vlsi/2152147/work/lec_env
chmod +x go_lec
./go_lec
### Debug 
rm -rf Bounce_flash_m.v
cp -rf /home/cc01group3/vlsi/2152147/work/synthesis_env/Genus_BoundFlasher/LAB1/outputs_Mar22-18:44:47/Bounce_flash_m.v ./
ll
vi ./Bounce_flash_m.v


/home/cc01group3/vlsi/2152147/work/synthesis_env/Genus_BoundFlasher/LAB1/reports_Mar22-18:44:47
bounce_flash.v
bounce_flash_tb.v

=======
vi reports_Mar22-18:02:54/final_qor.rpt
>>>>>>> Stashed changes
