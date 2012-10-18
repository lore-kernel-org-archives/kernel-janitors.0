From: Yuanhan Liu <yuanhan.liu@intel.com>
Date: Thu, 18 Oct 2012 05:14:49 +0000
Subject: [uapi:uapi-fixes 7/10] arch/ia64/include/asm/kvm_para.h:24:28: error: redefinition of 'kvm_arch_para
Message-Id: <20121018051449.GZ21995@yliu-dev.sh.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi David,

FYI, kernel build failed on

tree:   git://git.infradead.org/users/dhowells/linux-headers.git uapi-fixes
head:   bb2bab177408e44079ba6bd37242fa8b26dfc2a7
commit: 0420c87e648a3b623ad925038a0bcff2ef5a4bc9 [7/10] UAPI: Put a comment into uapi/asm-generic/kvm_para.h and use it from arches
config: ia64-allmodconfig # make ARCH=ia64 allmodconfig

All error/warnings:

In file included from include/uapi/linux/kvm_para.h:26:0,
                 from include/linux/kvm_para.h:4,
                 from kernel/watchdog.c:28:
arch/ia64/include/asm/kvm_para.h:24:28: error: redefinition of 'kvm_arch_para_features'
include/asm-generic/kvm_para.h:16:28: note: previous definition of 'kvm_arch_para_features' was here
arch/ia64/include/asm/kvm_para.h:29:20: error: redefinition of 'kvm_check_and_clear_guest_paused'
include/asm-generic/kvm_para.h:11:20: note: previous definition of 'kvm_check_and_clear_guest_paused' was here

vim +24 arch/ia64/include/asm/kvm_para.h

1a9c1ac4 include/asm-ia64/kvm_para.h      Xiantao Zhang 2008-04-01   8   * This program is distributed in the hope it will be useful, but WITHOUT
1a9c1ac4 include/asm-ia64/kvm_para.h      Xiantao Zhang 2008-04-01   9   * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
1a9c1ac4 include/asm-ia64/kvm_para.h      Xiantao Zhang 2008-04-01  10   * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
1a9c1ac4 include/asm-ia64/kvm_para.h      Xiantao Zhang 2008-04-01  11   * more details.
1a9c1ac4 include/asm-ia64/kvm_para.h      Xiantao Zhang 2008-04-01  12   *
1a9c1ac4 include/asm-ia64/kvm_para.h      Xiantao Zhang 2008-04-01  13   * You should have received a copy of the GNU General Public License along with
1a9c1ac4 include/asm-ia64/kvm_para.h      Xiantao Zhang 2008-04-01  14   * this program; if not, write to the Free Software Foundation, Inc., 59 Temple
1a9c1ac4 include/asm-ia64/kvm_para.h      Xiantao Zhang 2008-04-01  15   * Place - Suite 330, Boston, MA 02111-1307 USA.
1a9c1ac4 include/asm-ia64/kvm_para.h      Xiantao Zhang 2008-04-01  16   *
1a9c1ac4 include/asm-ia64/kvm_para.h      Xiantao Zhang 2008-04-01  17   */
43e40f25 arch/ia64/include/asm/kvm_para.h David Howells 2012-10-09  18  #ifndef __IA64_KVM_PARA_H
43e40f25 arch/ia64/include/asm/kvm_para.h David Howells 2012-10-09  19  #define __IA64_KVM_PARA_H
43e40f25 arch/ia64/include/asm/kvm_para.h David Howells 2012-10-09  20  
43e40f25 arch/ia64/include/asm/kvm_para.h David Howells 2012-10-09  21  #include <uapi/asm/kvm_para.h>
1a9c1ac4 include/asm-ia64/kvm_para.h      Xiantao Zhang 2008-04-01  22  
27c23810 arch/ia64/include/asm/kvm_para.h Avi Kivity    2009-08-16  23  
1a9c1ac4 include/asm-ia64/kvm_para.h      Xiantao Zhang 2008-04-01 @24  static inline unsigned int kvm_arch_para_features(void)
1a9c1ac4 include/asm-ia64/kvm_para.h      Xiantao Zhang 2008-04-01  25  {
1a9c1ac4 include/asm-ia64/kvm_para.h      Xiantao Zhang 2008-04-01  26  	return 0;
1a9c1ac4 include/asm-ia64/kvm_para.h      Xiantao Zhang 2008-04-01  27  }
1a9c1ac4 include/asm-ia64/kvm_para.h      Xiantao Zhang 2008-04-01  28  
3b5d56b9 arch/ia64/include/asm/kvm_para.h Eric B Munson 2012-03-10  29  static inline bool kvm_check_and_clear_guest_paused(void)
3b5d56b9 arch/ia64/include/asm/kvm_para.h Eric B Munson 2012-03-10  30  {
3b5d56b9 arch/ia64/include/asm/kvm_para.h Eric B Munson 2012-03-10  31  	return false;
3b5d56b9 arch/ia64/include/asm/kvm_para.h Eric B Munson 2012-03-10  32  }

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
