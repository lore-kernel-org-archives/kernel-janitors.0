From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 05 Jan 2013 17:17:48 +0000
Subject: build regressions 2013-01-05
Message-Id: <50e8603c.nzW54v65NC/UMbL/%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
fs/iov-iter.c:110:3: error: dereferencing pointer to incomplete type
fs/iov-iter.c:128:8: error: increment of pointer to unknown structure
fs/iov-iter.c:128:4: error: arithmetic on pointer to an incomplete type
drivers/acpi/processor_driver.c:351:2: error: 'else' without a previous 'if'

[warnings]
fs/iov-iter.c:112:10: warning: comparison of distinct pointer types lacks a cast [enabled by default]
fs/iov-iter.c:112:10: warning: type defaults to 'int' in declaration of '_min2'

[sparse]
net/ipv6/netfilter/ip6t_NPT.c:70:29: sparse: incorrect type in argument 2 (different base types)
drivers/acpi/processor_driver.c:377:9: sparse: Trying to use reserved word 'if' as identifier
drivers/acpi/processor_driver.c:380:9: sparse: Trying to use reserved word 'return' as identifier
drivers/acpi/processor_driver.c:351:14: sparse: Expected ; at end of statement
drivers/acpi/processor_driver.c:351:14: sparse: got if
drivers/acpi/processor_driver.c:354:14: sparse: got {
drivers/acpi/processor_driver.c:377:13: sparse: Expected ) in function declarator
drivers/acpi/processor_driver.c:377:13: sparse: got (
drivers/acpi/processor_driver.c:380:16: sparse: Expected ; at end of declaration
drivers/acpi/processor_driver.c:381:1: sparse: Expected ; at the end of type declaration
drivers/acpi/processor_driver.c:675:17: sparse: got acpi_exception
drivers/acpi/processor_driver.c:351:9: sparse: undefined identifier 'else'
drivers/acpi/processor_driver.c:376:39: sparse: undefined identifier 'pr'

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
