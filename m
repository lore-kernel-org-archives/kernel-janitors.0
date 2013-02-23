From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 23 Feb 2013 22:29:44 +0000
Subject: build regressions 2013-02-23
Message-Id: <512942d8.tLaTeezuHIHPnX1K%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
mm/shmem.c:2910:2: error: 'error' undeclared (first use in this function)
fs/cifs/readdir.c:87:3: error: expected ')' before 'return'
fs/cifs/readdir.c:127:1: error: expected expression before '}' token
arch/sh/kernel/kgdb.c:225:32: error: implicit declaration of function 'task_stack_page' [-Werror=implicit-function-declaration]
arch/sh/kernel/kgdb.c:242:23: error: dereferencing pointer to incomplete type
arch/sh/kernel/kgdb.c:243:22: error: dereferencing pointer to incomplete type
arch/sh/kernel/kgdb.c:310:27: error: 'SIGTRAP' undeclared (first use in this function)
vmci_queue_pair.c:(.text+0x3032f1): undefined reference to `memcpy_toiovec'
vmci_queue_pair.c:(.text+0x3034e1): undefined reference to `memcpy_fromiovec'
ERROR: "memcpy_toiovec" [drivers/misc/vmw_vmci/vmw_vmci.ko] undefined!
ERROR: "memcpy_fromiovec" [drivers/misc/vmw_vmci/vmw_vmci.ko] undefined!
drivers/iio/industrialio-triggered-buffer.c:20:16: error: 'iio_sw_buffer_preenable' undeclared here (not in a function)
drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c:176:3: error: implicit declaration of function 'iio_push_to_buffers' [-Werror=implicit-function-declaration]
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:106:36: error: dereferencing pointer to incomplete type
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:109:21: error: variable 'inv_mpu_trigger_ops' has initializer but incomplete type
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:110:2: error: unknown field 'owner' specified in initializer
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:111:2: error: unknown field 'set_trigger_state' specified in initializer
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:119:2: error: implicit declaration of function 'iio_trigger_alloc' [-Werror=implicit-function-declaration]
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:126:38: error: 'iio_trigger_generic_data_rdy_poll' undeclared (first use in this function)
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:132:10: error: dereferencing pointer to incomplete type
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:133:10: error: dereferencing pointer to incomplete type
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:134:10: error: dereferencing pointer to incomplete type
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:135:2: error: implicit declaration of function 'iio_trigger_register' [-Werror=implicit-function-declaration]
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:145:2: error: implicit declaration of function 'iio_trigger_free' [-Werror=implicit-function-declaration]
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:152:2: error: implicit declaration of function 'iio_trigger_unregister' [-Werror=implicit-function-declaration]

[warnings]
WARNING: net/vmw_vsock/vsock.o(.text+0x194): Section mismatch in reference from the function __vsock_core_init() to the function .init.text:vsock_init_tables()
drivers/base/firmware_class.c:1054:19: warning: 'fw' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/cifs/readdir.c:81:23: warning: unused variable 'cifs_sb' [-Wunused-variable]
fs/cifs/readdir.c:79:16: warning: unused variable 'inode' [-Wunused-variable]
fs/cifs/readdir.c:78:26: warning: unused variable 'alias' [-Wunused-variable]
drivers/mfd/sec-core.c:153:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
warning: (I2C_TAOS_EVM) selects SERIO_SERPORT which has unmet direct dependencies (!S390 && !UML && SERIO && TTY)
warning: (I2C_TAOS_EVM) selects SERIO_SERPORT which has unmet direct dependencies (!S390 && !UML && SERIO && TTY)
warning: (I2C_TAOS_EVM) selects SERIO_SERPORT which has unmet direct dependencies (!S390 && !UML && SERIO && TTY)
warning: (I2C_TAOS_EVM) selects SERIO_SERPORT which has unmet direct dependencies (!S390 && !UML && SERIO && TTY)
warning: (I2C_TAOS_EVM) selects SERIO_SERPORT which has unmet direct dependencies (!S390 && !UML && SERIO && TTY)
drivers/base/regmap/regmap.c:861:4: warning: format '%d' expects argument of type 'int', but argument 5 has type 'size_t' [-Wformat]
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:110:2: warning: excess elements in struct initializer [enabled by default]
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:110:2: warning: (near initialization for 'inv_mpu_trigger_ops') [enabled by default]
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:111:2: warning: excess elements in struct initializer [enabled by default]
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:111:2: warning: (near initialization for 'inv_mpu_trigger_ops') [enabled by default]
drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:119:11: warning: assignment makes pointer from integer without a cast [enabled by default]
warning: (AD7606 && AD799X_RING_BUFFER && MXS_LRADC && IIO_ADIS_LIB_BUFFER && INV_MPU6050_IIO && HID_SENSOR_ACCEL_3D && AD_SIGMA_DELTA && AD7266 && AD7298 && AD7476 && AD7887 && AT91_ADC && MAX1363 && HID_SENSOR_GYRO_3D && ADJD_S311 && HID_SENSOR_ALS && HID_SENSOR_MAGNETOMETER_3D) selects IIO_TRIGGERED_BUFFER which has unmet direct dependencies (IIO && IIO_BUFFER)
warning: (AD7606 && AD799X_RING_BUFFER && MXS_LRADC && IIO_ADIS_LIB_BUFFER && INV_MPU6050_IIO && HID_SENSOR_ACCEL_3D && AD_SIGMA_DELTA && AD7266 && AD7298 && AD7476 && AD7887 && AT91_ADC && MAX1363 && HID_SENSOR_GYRO_3D && ADJD_S311 && HID_SENSOR_ALS && HID_SENSOR_MAGNETOMETER_3D) selects IIO_TRIGGERED_BUFFER which has unmet direct dependencies (IIO && IIO_BUFFER)
warning: (AD7606 && AD799X_RING_BUFFER && MXS_LRADC && IIO_ADIS_LIB_BUFFER && INV_MPU6050_IIO && HID_SENSOR_ACCEL_3D && AD_SIGMA_DELTA && AD7266 && AD7298 && AD7476 && AD7887 && AT91_ADC && MAX1363 && HID_SENSOR_GYRO_3D && ADJD_S311 && HID_SENSOR_ALS && HID_SENSOR_MAGNETOMETER_3D) selects IIO_TRIGGERED_BUFFER which has unmet direct dependencies (IIO && IIO_BUFFER)
warning: (AD7606 && AD799X_RING_BUFFER && MXS_LRADC && IIO_ADIS_LIB_BUFFER && INV_MPU6050_IIO && HID_SENSOR_ACCEL_3D && AD_SIGMA_DELTA && AD7266 && AD7298 && AD7476 && AD7887 && AT91_ADC && MAX1363 && HID_SENSOR_GYRO_3D && ADJD_S311 && HID_SENSOR_ALS && HID_SENSOR_MAGNETOMETER_3D) selects IIO_TRIGGERED_BUFFER which has unmet direct dependencies (IIO && IIO_BUFFER)
warning: (AD7606 && AD799X_RING_BUFFER && MXS_LRADC && IIO_ADIS_LIB_BUFFER && INV_MPU6050_IIO && HID_SENSOR_ACCEL_3D && AD_SIGMA_DELTA && AD7266 && AD7298 && AD7476 && AD7887 && AT91_ADC && MAX1363 && HID_SENSOR_GYRO_3D && ADJD_S311 && HID_SENSOR_ALS && HID_SENSOR_MAGNETOMETER_3D) selects IIO_TRIGGERED_BUFFER which has unmet direct dependencies (IIO && IIO_BUFFER)

[sparse]
drivers/scsi/fnic/fnic_fcs.c:381:31: sparse: cast to restricted __be16
drivers/scsi/fnic/fnic_fcs.c:381:31: sparse: cast to restricted __be16
drivers/scsi/fnic/fnic_fcs.c:381:31: sparse: cast to restricted __be16
drivers/scsi/fnic/fnic_fcs.c:381:31: sparse: cast to restricted __be16
drivers/scsi/fnic/fnic_fcs.c:1198:6: sparse: context imbalance in 'fnic_handle_fip_timer' - different lock contexts for basic block
drivers/video/goldfishfb.c:280:9: sparse: cast removes address space of expression
drivers/video/goldfishfb.c:301:9: sparse: cast removes address space of expression

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
