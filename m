From: Alan Cox <alan@linux.intel.com>
Date: Tue, 16 Nov 2010 13:38:37 +0000
Subject: Re: [patch] Staging: intel_sst: fix memory leak
Message-Id: <20101116133837.19074497@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101113085826.GM3533@bicker>
In-Reply-To: <20101113085826.GM3533@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 13 Nov 2010 11:58:26 +0300
Dan Carpenter <error27@gmail.com> wrote:

> The original code set "str_info->decode_ibuf" to NULL so the kfree()
> is no-op.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> This is a static checker thing.  I don't have the hardware to test
> this myself so please check it carefully.

Acked-by: Alan Cox <alan@linux.intel.com>
