From: Randy Dunlap <rdunlap@xenotime.net>
Date: Thu, 16 Nov 2006 07:45:11 +0000
Subject: Re: [KJ] [PATCH] Fix arch/powerpc/platforms/iseries/pci.c to use
Message-Id: <20061115234511.aa6b936a.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <454A4B03.8090602@gmail.com>
In-Reply-To: <454A4B03.8090602@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 02 Nov 2006 11:46:11 -0800 David KOENIG wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> - From 605b32f23d62d93b0dcf36d4a8f8c2abf7b264be Mon Sep 17 00:00:00 2001
> From: David KOENIG <david@patrick.teapy>

Is that a real email address?

> Date: Mon, 23 Oct 2006 11:58:27 -0700
> Subject: [PATCH] Fix arch/powerpc/platforms/iseries/pci.c to use time_after

Please use expected patch format as documented in
Documentation/SubmittingPatches.

Attempting to apply this patch give me:

6 out of 7 hunks FAILED -- saving rejects to file arch/powerpc/platforms/iseries/pci.c.rej

I suppose it's due to lots of extra hyphens (dashes) at the
beginning of the deleted lines.  Does git do that?
or did the SHA1 envelope cause that?  or gmail do it?
Either way, it's broken.

Oh, something also converted all of the tabs to spaces.
gmail may have done that for (to) you unless you used the
gmail SMTP interface (instead of the web interface).


> - ---
>  arch/powerpc/platforms/iseries/pci.c |   13 +++++++------
>  1 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/iseries/pci.c
> b/arch/powerpc/platforms/iseries/pci.c
> index 4aa165e..b17fd12 100644
> - --- a/arch/powerpc/platforms/iseries/pci.c
> +++ b/arch/powerpc/platforms/iseries/pci.c
> @@ -19,6 +19,7 @@
>   * along with this program; if not, write to the Free Software
>   * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
>   */
> +#include <linux/jiffies.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/string.h>
> @@ -457,7 +458,7 @@ static u8 iSeries_Read_Byte(const volati
>                 static unsigned long last_jiffies;
>                 static int num_printed;
> 
> - -               if ((jiffies - last_jiffies) > 60 * HZ) {
> +               if (time_after(jiffies, last_jiffies + 60 * HZ)) {
>                         last_jiffies = jiffies;
>                         num_printed = 0;
>                 }
> @@ -485,7 +486,7 @@ static u16 iSeries_Read_Word(const volat
>                 static unsigned long last_jiffies;
>                 static int num_printed;
> 
> - -               if ((jiffies - last_jiffies) > 60 * HZ) {
> +               if (time_after(jiffies, last_jiffies + 60 * HZ)) {
>                         last_jiffies = jiffies;
>                         num_printed = 0;
>                 }
> @@ -514,7 +515,7 @@ static u32 iSeries_Read_Long(const volat
>                 static unsigned long last_jiffies;
>                 static int num_printed;
> 
> - -               if ((jiffies - last_jiffies) > 60 * HZ) {
> +               if (time_after(jiffies, last_jiffies + 60 * HZ)) {
>                         last_jiffies = jiffies;
>                         num_printed = 0;
>                 }
> @@ -550,7 +551,7 @@ static void iSeries_Write_Byte(u8 data,
>                 static unsigned long last_jiffies;
>                 static int num_printed;
> 
> - -               if ((jiffies - last_jiffies) > 60 * HZ) {
> +               if (time_after(jiffies, last_jiffies + 60 * HZ)) {
>                         last_jiffies = jiffies;
>                         num_printed = 0;
>                 }
> @@ -576,7 +577,7 @@ static void iSeries_Write_Word(u16 data,
>                 static unsigned long last_jiffies;
>                 static int num_printed;
> 
> - -               if ((jiffies - last_jiffies) > 60 * HZ) {
> +               if (time_after(jiffies, last_jiffies + 60 * HZ)) {
>                         last_jiffies = jiffies;
>                         num_printed = 0;
>                 }
> @@ -602,7 +603,7 @@ static void iSeries_Write_Long(u32 data,
>                 static unsigned long last_jiffies;
>                 static int num_printed;
> 
> - -               if ((jiffies - last_jiffies) > 60 * HZ) {
> +               if (time_after(jiffies, last_jiffies + 60 * HZ)) {
>                         last_jiffies = jiffies;
>                         num_printed = 0;
>                 }
> - --


---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
