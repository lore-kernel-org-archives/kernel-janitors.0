From: Randy Dunlap <rdunlap@infradead.org>
Date: Tue, 25 Nov 2014 02:21:46 +0000
Subject: Re: [PATCH 0/6] Fix a few typos around the word "destroy"
Message-Id: <5473E7BA.5050703@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <54736422.90409@users.sourceforge.net>
In-Reply-To: <54736422.90409@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, trivial@kernel.org, LKML <linux-kernel@vger.kernel.org>

On 11/24/2014 09:00 AM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 24 Nov 2014 17:34:23 +0100
> Subject: [PATCH 0/6] Fix a few typos around the word "destroy"
>
> The word "destroy" was mistyped in some files.

For all 6 patches;
Acked-by: Randy Dunlap <rdunlap@infradead.org>

However, in th3 future, please document each patch as described in
Documentation/SubmittingPatches:

   Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
   instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
   to do frotz", as if you are giving orders to the codebase to change
   its behaviour.

E.g., instead of:

A word was corrected in the description for a parameter of
the mmp_unregister_path() function.

Use:

Correct the description of a parameter of the mmp_unregister_path()
function.

Thanks.

>
> Markus Elfring (6):
>    isci: Fix a typo for the word "destroy"
>    SCSI-libfc: Fix typos for the word "destroy"
>    video: fbdev-MMP: Fix typos for the word "destroy"
>    f2fs: Fix typos for the word "destroy" in jump labels
>    video: fbdev-MMP: Fix a typo for the word "destroyed"
>    Documentation-SCSI: Fix a typo for the word "destroy"
>
>   Documentation/scsi/ChangeLog.lpfc | 2 +-
>   drivers/scsi/isci/remote_device.c | 2 +-
>   drivers/scsi/libfc/fc_fcp.c       | 4 ++--
>   drivers/video/fbdev/mmp/core.c    | 6 +++---
>   fs/f2fs/node.c                    | 8 ++++----
>   5 files changed, 11 insertions(+), 11 deletions(-)
>


-- 
~Randy
