From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 May 2015 10:13:44 +0000
Subject: re: bus: arm-ccn: cpumask attribute
Message-Id: <20150514101344.GA20531@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Pawel Moll,

The patch ffa415245b86: "bus: arm-ccn: cpumask attribute" from Apr
16, 2015, leads to the following static checker warning:

	drivers/bus/arm-ccn.c:1188 arm_ccn_pmu_cpu_notifier()
	warn: unsigned 'target' is never less than zero.

drivers/bus/arm-ccn.c
  1175  static int arm_ccn_pmu_cpu_notifier(struct notifier_block *nb,
  1176                  unsigned long action, void *hcpu)
  1177  {
  1178          struct arm_ccn_dt *dt = container_of(nb, struct arm_ccn_dt, cpu_nb);
  1179          struct arm_ccn *ccn = container_of(dt, struct arm_ccn, dt);
  1180          unsigned int cpu = (long)hcpu; /* for (long) see kernel/cpu.c */
  1181          unsigned int target;
  1182  
  1183          switch (action & ~CPU_TASKS_FROZEN) {
  1184          case CPU_DOWN_PREPARE:
  1185                  if (!cpumask_test_and_clear_cpu(cpu, &dt->cpu))
  1186                          break;
  1187                  target = cpumask_any_but(cpu_online_mask, cpu);
  1188                  if (target < 0)
                            ^^^^^^^^^^
target is unsigned and cpumask_any_but() returns unsigned.

  1189                          break;
  1190                  perf_pmu_migrate_context(&dt->pmu, cpu, target);
  1191                  cpumask_set_cpu(target, &dt->cpu);
  1192                  WARN_ON(irq_set_affinity(ccn->irq, &dt->cpu) != 0);
  1193          default:
  1194                  break;
  1195          }
  1196  
  1197          return NOTIFY_OK;
  1198  }

regards,
dan carpenter
