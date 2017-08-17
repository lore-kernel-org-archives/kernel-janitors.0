From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Aug 2017 07:44:16 +0000
Subject: [bug report] bpf/verifier: track liveness for pruning
Message-Id: <20170817074415.s24acvnsrask6ue2@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Edward Cree,

The patch dc503a8ad984: "bpf/verifier: track liveness for pruning"
from Aug 15, 2017, leads to the following static checker warning:

	kernel/bpf/verifier.c:3463 do_propagate_liveness()
	error: buffer overflow 'parent->regs' 11 <= 63

kernel/bpf/verifier.c
  3435  static bool do_propagate_liveness(const struct bpf_verifier_state *state,
  3436                                    struct bpf_verifier_state *parent)
  3437  {
  3438          bool touched = false; /* any changes made? */
  3439          int i;
  3440  
  3441          if (!parent)
  3442                  return touched;
  3443          /* Propagate read liveness of registers... */
  3444          BUILD_BUG_ON(BPF_REG_FP + 1 != MAX_BPF_REG);
  3445          /* We don't need to worry about FP liveness because it's read-only */
  3446          for (i = 0; i < BPF_REG_FP; i++) {

This loop goes from 0-ARRAY_SIZE(state->regs)

  3447                  if (parent->regs[i].live & REG_LIVE_READ)
  3448                          continue;
  3449                  if (state->regs[i].live = REG_LIVE_READ) {
  3450                          parent->regs[i].live |= REG_LIVE_READ;

So it's a more natural place to set parent->regs[i].live.

  3451                          touched = true;
  3452                  }
  3453          }
  3454          /* ... and stack slots */
  3455          for (i = 0; i < MAX_BPF_STACK / BPF_REG_SIZE; i++) {

This loop is longer.

  3456                  if (parent->stack_slot_type[i * BPF_REG_SIZE] != STACK_SPILL)
  3457                          continue;
  3458                  if (state->stack_slot_type[i * BPF_REG_SIZE] != STACK_SPILL)
  3459                          continue;
  3460                  if (parent->spilled_regs[i].live & REG_LIVE_READ)
  3461                          continue;
  3462                  if (state->spilled_regs[i].live = REG_LIVE_READ) {
  3463                          parent->regs[i].live |= REG_LIVE_READ;
                                ^^^^^^^^^^^^^^^^^^^^
And causes a static checker warning.  Smatch doesn't track arrays well,
and I also find it tricky to know if this is a real bug or we always hit
a continue or whatever so I'm not sure if this a real bug or not.

  3464                          touched = true;
  3465                  }
  3466          }
  3467          return touched;
  3468  }

regards,
dan carpenter
