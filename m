From: Gerd Hoffmann <kraxel@redhat.com>
Date: Wed, 26 Sep 2012 06:20:19 +0000
Subject: Re: [usb:usb-next 66/70] drivers/usb/storage/uas.c:638:12: sparse: context imbalance in 'uas_eh_task
Message-Id: <50629EA3.80307@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120926030632.GD13486@localhost>
In-Reply-To: <20120926030632.GD13486@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 09/26/12 05:06, Fengguang Wu wrote:
> Hi Gerd,
> 
> FYI, there are new sparse warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
> head:   655db7980596f0ad4f15f8f4c51beb3e705762de
> commit: e064852072c47b69f62325c6b7fa4a58332655bd [66/70] USB: uas: add locking
> 
> + drivers/usb/storage/uas.c:638:12: sparse: context imbalance in 'uas_eh_task_mgmt' - wrong count at exit

Ok, that one is real, we don't unlock in the error paths, I'll send a
incremental fix in a moment.

>   drivers/usb/storage/uas.c: In function 'uas_stat_cmplt':
>   drivers/usb/storage/uas.c:280:15: warning: 'cmdinfo' may be used uninitialized in this function [-Wmaybe-uninitialized]

Wrong, can't happen, although that one is hard to see for gcc.  I'll see
what I can do about it.

cheers,
  Gerd

