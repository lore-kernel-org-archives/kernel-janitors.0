From: =?UTF-8?B?IlBldGVyIFBhbijmvZjljavlubMpIg==?=
Date: Mon, 08 Nov 2010 06:24:06 +0000
Subject: Re: [PATCH] ext4:memset is needless in ext4_ext_remove_space()
Message-Id: <4CD79786.9000303@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4CD75033.7080902@redflag-linux.com> <20101108043752.GB5563@bicker>
In-Reply-To: <20101108043752.GB5563@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>, =?UTF-8?B?Iua9mOWNq+W5syhQZXRlciBQ?= =?UTF-8?B?YW4pIg==?= <wppan@redflag-linux.com>, tytso@mit.edu, adilger.kernel@dilger.ca, linux-ext4@vger.kerne

On 2010年11月08日 12:37, Dan Carpenter wrote:
> This is inside a loop and sometimes we do i++ and sometimes i--. Are
> you absolutely positive that path + i isn't initialized?
>
> I haven't followed this code through all the way but my instinct is
> that the memset is there for a reason.
>    
I know that I misunderstood it.

Thank you!

Regards

Peter Pan
