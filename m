From: Alois Schloegl <alois.schloegl@ist.ac.at>
Date: Mon, 22 Oct 2012 10:42:49 +0000
Subject: Re: [staging:staging-next 115/274] drivers/staging/ced1401/usb1401.c:1065 Handle1401Esc() error: dou
Message-Id: <50852329.8080408@ist.ac.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAHdPZaPfEFkPmH_46uFQMMU4aiN1RmxFftMk02M58S4Z_CWxMw@mail.gmail.com>
In-Reply-To: <CAHdPZaPfEFkPmH_46uFQMMU4aiN1RmxFftMk02M58S4Z_CWxMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,


Please include (Greg Smith <greg@ced.co.uk>) into any communication.
Greg Smith from CED noticed that there is no kfree, causing a memory 
leak, and memset() has been removed, thus tx->used was not cleared.

The patch below should fix this.

   Alois




diff --git a/ced_ioc.c b/ced_ioc.c
index 4a13c10..fe15c44 100644
--- a/ced_ioc.c
+++ b/ced_ioc.c
@@ -895,15 +895,23 @@ int GetTransfer(DEVICE_EXTENSION *pdx, 
TGET_TX_BLOCK __user *pTX)
      else
      {
          // Return the best information we have - we don't have 
physical addresses
-        TGET_TX_BLOCK tx;
-        memset(&tx, 0, sizeof(tx));         // clean out local work 
structure
-        tx.size = pdx->rTransDef[dwIdent].dwLength;
-        tx.linear = (long long)((long)pdx->rTransDef[dwIdent].lpvBuff);
-        tx.avail = GET_TX_MAXENTRIES;       // how many blocks we could 
return
-        tx.used = 1;                        // number we actually return
-        tx.entries[0].physical = (long long)(tx.linear+pdx->StagedOffset);
-        tx.entries[0].size = tx.size;
-        copy_to_user(pTX, &tx, sizeof(tx));
+        TGET_TX_BLOCK *tx;
+        tx = kzalloc(sizeof(*tx), GFP_KERNEL);
+        if (!tx) {
+                mutex_unlock(&pdx->io_mutex);
+                return -ENOMEM;
+        }
+
+        memset(tx, 0, sizeof(*tx));         // clean out local work 
structure
+        tx->size = pdx->rTransDef[dwIdent].dwLength;
+        tx->linear = (long long)((long)pdx->rTransDef[dwIdent].lpvBuff);
+        tx->avail = GET_TX_MAXENTRIES;       // how many blocks we 
could return
+        tx->used = 1;                        // number we actually return
+        tx->entries[0].physical = (long 
long)(tx->linear+pdx->StagedOffset);
+        tx->entries[0].size = tx->size;
+        iReturn = copy_to_user(pTX, tx, sizeof(*tx));
+        kfree(tx);
+        return (iReturn);
      }
      mutex_unlock(&pdx->io_mutex);
      return iReturn;




On 10/07/2012 02:56 PM, devendra.aaru wrote:
> Hi, Fengguang,
>
> On Sun, Oct 7, 2012 at 7:07 AM, Fengguang Wu<fengguang.wu@intel.com>  wrote:
>> Hi Alois,
>>
>> FYI, there are new smatch warnings show up in
>>
>> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
>> head:   e1878957b4676a17cf398f7f5723b365e9a2ca48
>> commit: 2eae6bdc12f4e49b7f94f032b82d664dcf3881bc [115/274] Staging: add ced1401 USB driver
>>
>>
>> + drivers/staging/ced1401/ced_ioc.c:898 GetTransfer() warn: 'tx' puts 3104 bytes on stack
>
> I have a following patch to send to Greg, when the merge window closes:
>
>
>  From 7d9b8485ab837bf9e0f960d090f90c6518f7e2db Mon Sep 17 00:00:00 2001
> From: Devendra Naga<devendra.aaru@gmail.com>
> Date: Sat, 6 Oct 2012 02:57:42 -0400
> Subject: [PATCH 1/4] staging: ced1401: fix a frame size warning
>
> gcc/sparse complain about the following:
>
> drivers/staging/ced1401/ced_ioc.c:931:1: warning: the frame size of
> 4144 bytes is larger than 2048 bytes [-Wframe-larger-than=]
>
> fix it by using a pointer of the TGET_TX_BLOCK struct
>
> Signed-off-by: Devendra Naga<devendra.aaru@gmail.com>
> ---
>   drivers/staging/ced1401/ced_ioc.c |   28 +++++++++++++++++-----------
>   1 file changed, 17 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/staging/ced1401/ced_ioc.c
> b/drivers/staging/ced1401/ced_ioc.c
> index c9492ed..a136ca3 100644
> --- a/drivers/staging/ced1401/ced_ioc.c
> +++ b/drivers/staging/ced1401/ced_ioc.c
> @@ -913,17 +913,23 @@ int GetTransfer(DEVICE_EXTENSION * pdx,
> TGET_TX_BLOCK __user * pTX)
>                  iReturn = U14ERR_BADAREA;
>          else {
>                  // Return the best information we have - we don't have
> physical addresses
> -               TGET_TX_BLOCK tx;
> -               memset(&tx, 0, sizeof(tx));     // clean out local
> work structure
> -               tx.size = pdx->rTransDef[dwIdent].dwLength;
> -               tx.linear = (long long)((long)pdx->rTransDef[dwIdent].lpvBuff);
> -               tx.avail = GET_TX_MAXENTRIES;   // how many blocks we
> could return
> -               tx.used = 1;    // number we actually return
> -               tx.entries[0].physical > -                   (long long)(tx.linear + pdx->StagedOffset);
> -               tx.entries[0].size = tx.size;
> -
> -               if (copy_to_user(pTX,&tx, sizeof(tx)))
> +               TGET_TX_BLOCK *tx;
> +
> +               tx = kzalloc(sizeof(*tx), GFP_KERNEL);
> +               if (!tx) {
> +                       mutex_unlock(&pdx->io_mutex);
> +                       return -ENOMEM;
>
> +               }
> +
> +               tx->size = pdx->rTransDef[dwIdent].dwLength;
> +               tx->linear = (long long)((long)pdx->rTransDef[dwIdent].lpvBuff);
> +               tx->avail = GET_TX_MAXENTRIES;  // how many blocks we
> could return
> +               tx->used = 1;   // number we actually return
> +               tx->entries[0].physical > +                   (long long)(tx->linear + pdx->StagedOffset);
> +               tx->entries[0].size = tx->size;
> +
> +               if (copy_to_user(pTX, tx, sizeof(*tx)))
>                          iReturn = -EFAULT;
>          }
>          mutex_unlock(&pdx->io_mutex);
>
>> 0-DAY kernel build testing backend         Open Source Technology Center
>> Fengguang Wu, Yuanhan Liu                              Intel Corporation
>>
>> _______________________________________________
>> devel mailing list
>> devel@linuxdriverproject.org
>> http://driverdev.linuxdriverproject.org/mailman/listinfo/devel
>>
>
> Thanks,

