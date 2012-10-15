From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 15 Oct 2012 02:18:31 +0000
Subject: [arm-soc:testing/defconfig-warnings 14/14] arch/arm/boot/compressed/../../../../lib/decompress_unlzo
Message-Id: <20121015021831.GC7203@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121015021801.GB7203@localhost>
In-Reply-To: <20121015021801.GB7203@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Arnd,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git testing/defconfig-warnings
head:   b8848fafef862602bfad86686d6da00dce80b9c6
commit: b8848fafef862602bfad86686d6da00dce80b9c6 [14/14] Merge branches 'warnings/broken', 'warnings/mtd', 'warnings/missing' and 'warnings/randconfig' into HEAD
config: arm-imx_v6_v7_defconfig # make ARCH=arm imx_v6_v7_defconfig

All error/warnings:

In file included from arch/arm/boot/compressed/decompress.c:43:0:
arch/arm/boot/compressed/../../../../lib/decompress_unlzo.c:34:39: fatal error: lzo/lzo1x_decompress_safe.c: No such file or directory
compilation terminated.

vim +34 arch/arm/boot/compressed/../../../../lib/decompress_unlzo.c

7dd65feb Albin Tonnerre 2010-01-08  18   * This program is distributed in the hope that it will be useful,
7dd65feb Albin Tonnerre 2010-01-08  19   * but WITHOUT ANY WARRANTY; without even the implied warranty of
7dd65feb Albin Tonnerre 2010-01-08  20   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
7dd65feb Albin Tonnerre 2010-01-08  21   * GNU General Public License for more details.
7dd65feb Albin Tonnerre 2010-01-08  22   *
7dd65feb Albin Tonnerre 2010-01-08  23   * You should have received a copy of the GNU General Public License
7dd65feb Albin Tonnerre 2010-01-08  24   * along with this program; see the file COPYING.
7dd65feb Albin Tonnerre 2010-01-08  25   * If not, write to the Free Software Foundation, Inc.,
7dd65feb Albin Tonnerre 2010-01-08  26   * 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
7dd65feb Albin Tonnerre 2010-01-08  27   *
7dd65feb Albin Tonnerre 2010-01-08  28   * Markus F.X.J. Oberhumer
7dd65feb Albin Tonnerre 2010-01-08  29   * <markus@oberhumer.com>
7dd65feb Albin Tonnerre 2010-01-08  30   * http://www.oberhumer.com/opensource/lzop/
7dd65feb Albin Tonnerre 2010-01-08  31   */
7dd65feb Albin Tonnerre 2010-01-08  32  
7dd65feb Albin Tonnerre 2010-01-08  33  #ifdef STATIC
63889997 Arnd Bergmann  2012-10-11 @34  #include "lzo/lzo1x_decompress_safe.c"
7dd65feb Albin Tonnerre 2010-01-08  35  #else
7dd65feb Albin Tonnerre 2010-01-08  36  #include <linux/decompress/unlzo.h>
7dd65feb Albin Tonnerre 2010-01-08  37  #endif
7dd65feb Albin Tonnerre 2010-01-08  38  
7dd65feb Albin Tonnerre 2010-01-08  39  #include <linux/types.h>
7dd65feb Albin Tonnerre 2010-01-08  40  #include <linux/lzo.h>
7dd65feb Albin Tonnerre 2010-01-08  41  #include <linux/decompress/mm.h>
7dd65feb Albin Tonnerre 2010-01-08  42  

The code at line 34 was first introduced by commit:
6388999 lzo: include the right file in decompress_unlzo.c [sent to maintainer]


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
