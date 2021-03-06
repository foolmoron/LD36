﻿using UnityEngine;
using System.Collections;

public class Cube : MonoBehaviour {
    
    Renderer thisRenderer;
    ParticleSystem particles;

    void Start() {
        thisRenderer = GetComponent<Renderer>();
        particles = GameObject.Find("TheParticles").GetComponent<ParticleSystem>();
    }
    
    void Update() {
        var s = ScreenPos.FromTransform(transform, Camera.main);
        particles.startSize = Mathf.Lerp(0, 2.5f, s.x);
        var e = particles.emission;
        e.rate = Mathf.Lerp(0, 1200, s.y);
    }
}
