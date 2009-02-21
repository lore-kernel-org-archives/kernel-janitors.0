From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 21 Feb 2009 01:17:58 +0000
Subject: [PATCH 0/2] KVM: fix sparse warnings
Message-Id: <20090221011723.7022.97639.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Avi Kivity <avi@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The following fix some sparse warnings in KVM.

---

Hannes Eder (2):
      KVM: fix sparse warnings: Should it be static?
      KVM: fix sparse warnings: context imbalance


 arch/x86/kvm/i8259.c |    2 ++
 arch/x86/kvm/mmu.c   |   11 ++++++-----
 arch/x86/kvm/x86.c   |    8 ++++----
 virt/kvm/irq_comm.c  |    4 ++--
 4 files changed, 14 insertions(+), 11 deletions(-)
