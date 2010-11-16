From: Alan Cox <alan@linux.intel.com>
Date: Tue, 16 Nov 2010 13:38:01 +0000
Subject: Re: [patch] Staging: cptm1217: move free under dereference
Message-Id: <20101116133801.0ef1e4c3@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101113083416.GL3533@bicker>
In-Reply-To: <20101113083416.GL3533@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 13 Nov 2010 11:34:16 +0300
Dan Carpenter <error27@gmail.com> wrote:

> We dereference "ts" in the printk so move the kfree() down a line.

Acked-by: Alan Cox <alan@linux.intel.com>
