From: Dan Carpenter <error27@gmail.com>
Date: Thu, 05 Aug 2010 09:59:51 +0000
Subject: Re: [PATCH 2/2] kprobes: verify jprobe entry point
Message-Id: <20100805095951.GG9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280820323-18929-2-git-send-email-namhyung@gmail.com>
In-Reply-To: <1280820323-18929-2-git-send-email-namhyung@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Aug 05, 2010 at 11:41:41AM +0200, walter harms wrote:
> 
> I am a bit converned about this code here:
> 	if (kallsyms_lookup_size_offset(addr, NULL, &offset) &&  offset = 0)
> 
> offset is set inside kallsyms_lookup_size_offset(), right ?
> but can you guarantee that the calling sequence is the same on all processors ?
> (it is  not in case of functions).
> 

Namhyung Kim's version is fine.

regards,
dan carpenter
