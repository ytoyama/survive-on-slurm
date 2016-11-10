#!/usr/bin/env python3

import tensorflow as tf

with tf.Session() as s:
  print(s.run(tf.constant(42)))
