# OVRWatcher: Side-channel Inference of User Activities in AR/VR Using GPU Profiling

OVRWatcher is a research project that studies whether low-resolution GPU profiling data can reveal user activities in AR/VR environments. The project focuses on Meta Quest devices and shows that GPU metrics collected at 1 Hz can be used to fingerprint AR/VR applications, WebXR applications, virtual objects, and meeting-room activity.

This repository contains the datasets and results used for the OVRWatcher paper.

Paper: Side-channel Inference of User Activities in AR/VR Using GPU Profiling
Venue: NDSS Symposium 2026
Project page: https://www.ndss-symposium.org/ndss-paper/side-channel-inference-of-user-activities-in-ar-vr-using-gpu-profiling/

## Overview

Modern AR/VR devices render complex 3D scenes using powerful GPUs. OVRWatcher shows that GPU profiling metrics can be correlated with application behavior and user interactions. Unlike prior AR/VR side-channel work that relies on high-resolution profiling or concurrent malicious apps, OVRWatcher studies a low-resolution GPU profiling channel and evaluates its feasibility on Meta Quest devices.

The main experiments include:

* AR/VR standalone app fingerprinting
* WebXR app fingerprinting
* Virtual furniture/object inference
* Virtual meeting-room participant inference
* User study with realistic AR/MR interactions

## Repository Structure

```text
OVRWatcher/
├── C1_App/
│   ├── Quest2/
│   ├── Quest3/
│   ├── Result/
│   ├── Result_50/
│   └── Result_extra50/
│
├── C2_WebXR/
│   ├── Quest2/
│   └── Quest3S/
│
├── C3_Furniture/
│   ├── CrossSetupResults/
│   ├── Quest3/
│   ├── Result_furniture_DF_S1_D3/
│   ├── Result_furniture_LR_S1_D3/
│   ├── Result_furniture_MR_S1_D3/
│   ├── Result_furniture_MR_S1_D3_livingroom/
│   └── Result_furniture_MR_S1_D3_office/
│
├── C4_MeetingRoom/
│   ├── AvatarResult_MR/
│   ├── AvatarResult_MR_DF/
│   ├── AvatarResult_Office/
│   └── AvatarResult_VR/
│
├── C5_UserStudy/
│   ├── Result_dynamic/
│   └── Result_static/
│
└── README.md
```

## Directory Description

### C1_App

This directory contains data and results for standalone AR/VR application fingerprinting. In this case study, OVRWatcher analyzes GPU metric traces collected while different Meta Quest applications are launched and rendered. The paper evaluates 100 standalone AR/VR applications and shows that each app produces a distinguishable GPU fingerprint.

### C2_WebXR

This directory contains data and results for WebXR application fingerprinting. WebXR applications run through the browser but still rely on GPU rendering. OVRWatcher evaluates whether GPU metrics can distinguish different WebXR apps even when they are rendered through a browser interface.

### C3_Furniture

This directory contains data and results for virtual object and furniture inference. The experiment evaluates whether GPU profiling traces can reveal which virtual furniture object is rendered in AR/VR scenes. The scenarios include default VR scenes, living-room scenes, office scenes, and mixed-reality setups.

### C4_MeetingRoom

This directory contains data and results for virtual meeting-room inference. This case study evaluates whether GPU metrics can reveal contextual information in a virtual meeting environment, such as the number of rendered avatars or participants.

### C5_UserStudy

This directory contains user-study results. The user study evaluates OVRWatcher in more realistic interaction scenarios, including static and dynamic user activities.

## Main Findings

The paper reports that OVRWatcher can achieve high inference accuracy using low-resolution GPU metrics. In particular:

* Over 99% accuracy for standalone AR/VR app fingerprinting
* About 99% accuracy for WebXR app fingerprinting
* Over 98% accuracy for object-level inference in controlled settings
* Up to 88% accuracy in a real-world user study
* Over 93% accuracy in cross-device settings across Meta Quest devices

These results show that low-resolution GPU profiling can still leak sensitive information in immersive AR/VR environments.

## Ethical Use

This repository is intended for academic research and reproducibility. The data and results should be used only for privacy, security, and defense-oriented research. Do not use this project to monitor, profile, or infer user activities without explicit permission.

The findings were responsibly disclosed to Meta through the Meta Bug Bounty program.

## Citation

If you use this repository or the OVRWatcher dataset, please cite the paper:

```bibtex
@inproceedings{son2026ovrwatcher,
  title     = {Side-channel Inference of User Activities in AR/VR Using GPU Profiling},
  author    = {Son, Seonghun and Mukherjee, Chandrika and Aburas, Reham Mohamed and Gulmezoglu, Berk and Celik, Z. Berkay},
  booktitle = {Network and Distributed System Security (NDSS) Symposium},
  year      = {2026}
}
```

## Contact

For questions about the project, please contact the authors of the paper.
::: 
