From: Yuanhan Liu <yuanhan.liu@intel.com>
Date: Thu, 18 Oct 2012 08:23:11 +0000
Subject: [sound:for-next 10/15] sound/pci/ice1712/wm8766.c:35 snd_wm8766_write() error: buffer overflow 'wm->
Message-Id: <20121018082311.GL21995@yliu-dev.sh.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Ondrej,

FYI, there are new smatch warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   de3ab850a0e883329594f62ec18fecef4fcfe5ca
commit: 45d44e5a945296693b392ea807768329c1a80af6 [10/15] ALSA: ice1712: Add Wolfson Microelectronics WM8766 codec support

+ sound/pci/ice1712/wm8766.c:35 snd_wm8766_write() error: buffer overflow 'wm->regs' 16 <= 30

vim +35 sound/pci/ice1712/wm8766.c

45d44e5a Ondrej Zary 2012-10-14  19   *   along with this program; if not, write to the Free Software
45d44e5a Ondrej Zary 2012-10-14  20   *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
45d44e5a Ondrej Zary 2012-10-14  21   *
45d44e5a Ondrej Zary 2012-10-14  22   */
45d44e5a Ondrej Zary 2012-10-14  23  
45d44e5a Ondrej Zary 2012-10-14  24  #include <linux/delay.h>
45d44e5a Ondrej Zary 2012-10-14  25  #include <sound/core.h>
45d44e5a Ondrej Zary 2012-10-14  26  #include <sound/control.h>
45d44e5a Ondrej Zary 2012-10-14  27  #include <sound/tlv.h>
45d44e5a Ondrej Zary 2012-10-14  28  #include "wm8766.h"
45d44e5a Ondrej Zary 2012-10-14  29  
45d44e5a Ondrej Zary 2012-10-14  30  /* low-level access */
45d44e5a Ondrej Zary 2012-10-14  31  
45d44e5a Ondrej Zary 2012-10-14  32  static void snd_wm8766_write(struct snd_wm8766 *wm, u16 addr, u16 data)
45d44e5a Ondrej Zary 2012-10-14  33  {
45d44e5a Ondrej Zary 2012-10-14  34  	if (addr < WM8766_REG_RESET)
45d44e5a Ondrej Zary 2012-10-14 @35  		wm->regs[addr] = data;
45d44e5a Ondrej Zary 2012-10-14  36  	wm->ops.write(wm, addr, data);
45d44e5a Ondrej Zary 2012-10-14  37  }
45d44e5a Ondrej Zary 2012-10-14  38  
45d44e5a Ondrej Zary 2012-10-14  39  /* mixer controls */
45d44e5a Ondrej Zary 2012-10-14  40  
45d44e5a Ondrej Zary 2012-10-14  41  static const DECLARE_TLV_DB_SCALE(wm8766_tlv, -12750, 50, 1);
45d44e5a Ondrej Zary 2012-10-14  42  
45d44e5a Ondrej Zary 2012-10-14  43  static struct snd_wm8766_ctl snd_wm8766_default_ctl[WM8766_CTL_COUNT] = {

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
