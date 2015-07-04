From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 04 Jul 2015 10:08:41 +0000
Subject: Re: [PATCH] fs-notify: Deletion of an unnecessary check before the function call "iput"
Message-Id: <5597B0A9.8010308@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <5479EAD6.1080706@users.sourceforge.net>
In-Reply-To: <5479EAD6.1080706@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 29 Nov 2014 16:42:50 +0100
> 
> The iput() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/notify/inode_mark.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/notify/inode_mark.c b/fs/notify/inode_mark.c
> index 3daf513..d8157a6 100644
> --- a/fs/notify/inode_mark.c
> +++ b/fs/notify/inode_mark.c
> @@ -231,8 +231,7 @@ void fsnotify_unmount_inodes(struct list_head *list)
>  		 */
>  		spin_unlock(&inode_sb_list_lock);
>  
> -		if (need_iput_tmp)
> -			iput(need_iput_tmp);
> +		iput(need_iput_tmp);
>  
>  		/* for each watch, send FS_UNMOUNT and then remove it */
>  		fsnotify(inode, FS_UNMOUNT, inode, FSNOTIFY_EVENT_INODE, NULL, 0);
> 

Would anybody like to integrate this update suggestion
into another source code repository?

Regards,
Markus
