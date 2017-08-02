From: Sam van Hunsel <ivan.dolokvich@yandex.ru>
Date: Wed, 02 Aug 2017 17:41:01 +0000
Subject: [PATCH] Staging: lirc: remove FSF's mailing address from GPL notice
Message-Id: <20170802174056.GA22022@freebox.local>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The FSF may change addresses again, as they have done in the past. Linux
also already includes a copy of the GPL. This patch fixes an issue found by
checkpatch.

Signed-off-by: Sam van Hunsel <ivan.dolokvich@yandex.ru>
---
 drivers/staging/media/lirc/lirc_zilog.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/media/lirc/lirc_zilog.c b/drivers/staging/media/lirc/lirc_zilog.c
index 015e41bd036e..36b288d811e9 100644
--- a/drivers/staging/media/lirc/lirc_zilog.c
+++ b/drivers/staging/media/lirc/lirc_zilog.c
@@ -33,10 +33,6 @@
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- *
  */
 
 #include <linux/module.h>
-- 
2.13.0

