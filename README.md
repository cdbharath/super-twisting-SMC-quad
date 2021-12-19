# Super Twisting Sliding Mode control of a Quadrotor for Fault Tolerance

<p float="left">
  <img src="images/SMC.gif" />
</p>
** With out Super Twisting Sliding Mode Controller with Control Allocation (left). With Super Twisting Sliding Mode Controller with Control Allocation (right). **  
<br />
<br />

<p align="justify">
A quadrotor has complex system dynamics with a variety of system states variables. That being said, the number of inputs available doesn’t allow the quadrotor to have input redundancy. This makes it difficult for controlling an under actuated quadrotor. If situational discrepancy leads to the under performance of the propeller actuators, the quadrotor loses its control and fails to follow the desired trajectory. The under performance can be really risky leading to the crash landing of the quadrotor. Considering the high-cost sensors and the load mounted on the quadrotor, crash landing can be a serious loss and dangerous for the surrounding environment. To overcome such situations, a fault tolerant controller has been designed to trigger appropriate control on the detection of faults among the propeller actuators.
</p>

<p align="justify">
Among various control algorithms, Sliding Mode Control (SMC) has been observed to produce robust results on control of underactuated systems. Since SMC produces an undesirable high frequency chattering effect, an alternative has been provided to replace the nonlinear switching function. Super Twisting Sliding Mode Control (STW SMC) is implemented to remove such undesirable high frequency chattering. On detection of the faults using state estimators, a control allocation algorithm is triggered. Based on appropriate loss of actuator effectiveness (LAE), control allocation is implemented and the quadrotor is made to follow the trajectory and land safely without any disturbances. The following will elaborate on the mathematical modelling and controller design to implement such a FTC for the quadrotor.
</p>

**The controller block diagram:**


![alt_text](images/image1.png "image_tooltip")


**Trajectory Tracking results:**


![alt_text](images/image2.png "image_tooltip")

     Super twisting control without control allocation


![alt_text](images/image3.png "image_tooltip")


     Super twisting control with control allocation


![alt_text](images/image4.png "image_tooltip")
       
     Nominal Sliding mode control with control allocation

**Control inputs for tracking trajectory:**


![alt_text](images/image5.png "image_tooltip")
 

     Super twisting control without control allocation



![alt_text](images/image6.png "image_tooltip")


     Super twisting with control allocation



![alt_text](images/image7.png "image_tooltip")


     Nominal Sliding mode control with control allocation

**Error while tracking trajectory:**


![alt_text](images/image8.png "image_tooltip")


     Super twisting SMC without control allocation


![alt_text](images/image9.png "image_tooltip")
 

     Super twisting SMC with control allocation


![alt_text](images/image10.png "image_tooltip")


     Nominal SMC with control allocation

