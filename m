From: Marek Lindner <lindner_marek@yahoo.de>
Date: Tue, 30 Mar 2010 02:08:15 +0000
Subject: Re: [patch v2] batman: cleanup: change test for end of array
Message-Id: <201003301008.15476.lindner_marek@yahoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100328131335.GY5069@bicker>
In-Reply-To: <20100328131335.GY5069@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Monday 29 March 2010 16:11:34 Dan Carpenter wrote:
> > I might be mistaken but it looks like the "&" is wrong here. Shouldn't it
> > be: memset(device_client_hash, 0, sizeof(device_client_hash));
> 
> Either way works.

Ok, I committed it without the "&" - makes me sleep better.  ;-)

Thanks for the patch,
Marek
