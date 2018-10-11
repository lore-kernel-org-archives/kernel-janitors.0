From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Oct 2018 12:01:19 +0000
Subject: [bug report] tc: Add support for configuring the taprio scheduler
Message-Id: <20181011120118.GA21961@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Vinicius Costa Gomes,

The patch 5a781ccbd19e: "tc: Add support for configuring the taprio
scheduler" from Sep 28, 2018, leads to the following static checker
warning:

	net/sched/sch_taprio.c:647 taprio_change()
	warn: can 'mqprio' even be NULL?

net/sched/sch_taprio.c
   578  static int taprio_change(struct Qdisc *sch, struct nlattr *opt,
   579                           struct netlink_ext_ack *extack)
   580  {
   581          struct nlattr *tb[TCA_TAPRIO_ATTR_MAX + 1] = { };
   582          struct taprio_sched *q = qdisc_priv(sch);
   583          struct net_device *dev = qdisc_dev(sch);
   584          struct tc_mqprio_qopt *mqprio = NULL;
                                       ^^^^^^^^^^^^^
   585          struct ethtool_link_ksettings ecmd;
   586          int i, err, size;
   587          s64 link_speed;
   588          ktime_t start;
   589  
   590          err = nla_parse_nested(tb, TCA_TAPRIO_ATTR_MAX, opt,
   591                                 taprio_policy, extack);
   592          if (err < 0)
   593                  return err;
   594  
   595          err = -EINVAL;
   596          if (tb[TCA_TAPRIO_ATTR_PRIOMAP])
   597                  mqprio = nla_data(tb[TCA_TAPRIO_ATTR_PRIOMAP]);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   598  
   599          err = taprio_parse_mqprio_opt(dev, mqprio, extack);
                                                   ^^^^^^
This returns error pointer is mqprio is NULL.

   600          if (err < 0)
   601                  return err;
   602  
   603          /* A schedule with less than one entry is an error */
   604          size = parse_taprio_opt(tb, q, extack);
   605          if (size < 0)
   606                  return size;
   607  
   608          hrtimer_init(&q->advance_timer, q->clockid, HRTIMER_MODE_ABS);
   609          q->advance_timer.function = advance_sched;
   610  
   611          switch (q->clockid) {
   612          case CLOCK_REALTIME:
   613                  q->get_time = ktime_get_real;
   614                  break;
   615          case CLOCK_MONOTONIC:
   616                  q->get_time = ktime_get;
   617                  break;
   618          case CLOCK_BOOTTIME:
   619                  q->get_time = ktime_get_boottime;
   620                  break;
   621          case CLOCK_TAI:
   622                  q->get_time = ktime_get_clocktai;
   622                  q->get_time = ktime_get_clocktai;
   623                  break;
   624          default:
   625                  return -ENOTSUPP;
   626          }
   627  
   628          for (i = 0; i < dev->num_tx_queues; i++) {
   629                  struct netdev_queue *dev_queue;
   630                  struct Qdisc *qdisc;
   631  
   632                  dev_queue = netdev_get_tx_queue(dev, i);
   633                  qdisc = qdisc_create_dflt(dev_queue,
   634                                            &pfifo_qdisc_ops,
   635                                            TC_H_MAKE(TC_H_MAJ(sch->handle),
   636                                                      TC_H_MIN(i + 1)),
   637                                            extack);
   638                  if (!qdisc)
   639                          return -ENOMEM;
   640  
   641                  if (i < dev->real_num_tx_queues)
   642                          qdisc_hash_add(qdisc, false);
   643  
   644                  q->qdiscs[i] = qdisc;
   645          }
   646  
   647          if (mqprio) {
                    ^^^^^^
This can't be NULL.  Smatch doesn't always complain about unnecessary
NULL checks, but the reason that Smatch complains about it is because it
thinks we are whether if nla_data() returns NULL.

   648                  netdev_set_num_tc(dev, mqprio->num_tc);
   649                  for (i = 0; i < mqprio->num_tc; i++)
   650                          netdev_set_tc_queue(dev, i,
   651                                              mqprio->count[i],
   652                                              mqprio->offset[i]);

regards,
dan carpenter
