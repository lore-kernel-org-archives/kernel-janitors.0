From: Daniel Drake <dsd@gentoo.org>
Date: Wed, 02 Feb 2005 00:09:43 +0000
Subject: [KJ] Re: driver model u32 -> pm_message_t conversion: help needed
Message-Id: <42001A47.40409@gentoo.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050125194710.GA1711@elf.ucw.cz>
In-Reply-To: <20050125194710.GA1711@elf.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: kernel-janitors@osdl.org, kernel list <linux-kernel@vger.kernel.org>, linux-pm@osdl.org, benh@kernel.crashing.org

Hi Pavel,

Pavel Machek wrote:
> Now, if you want to help, just convert some drivers... To quickly
> break compilation in case of bad types, following patch can be used
> (against 2.6.11-rc2-mm1), it actually switches pm_message_t to
> typedef.
> 
> I'm looking forward to the patches, (please help),

I just had a look at converting some but then found some identical patches 
written by you elsewhere. Are there any remaining conversions to be done? 
Perhaps you could post some grep output from your local tree if there are?

Thanks,
Daniel
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
