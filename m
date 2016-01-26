From: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <m@bjorling.me>
Date: Tue, 26 Jan 2016 09:56:57 +0000
Subject: Re: [patch] nvme: lightnvm: buffer overflow in nvme_nvm_identity()
Message-Id: <56A742E9.3040108@bjorling.me>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160126092734.GE15717@mwanda>
In-Reply-To: <20160126092734.GE15717@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 01/26/2016 10:27 AM, Dan Carpenter wrote:
> nvme_nvm_id->ppaf is 4 bytes larger than nvm_id->ppaf.  We're using the
> larger size struct for the sizeof() so we end up corrupting the
> first four bytes of nvm_id->groups[].  It doesn't look like we actually
> want to copy those last bytes anyway.
> 

Thanks, Dan. You are right. The four bytes are overwritten afterwards
and hid the issue.
