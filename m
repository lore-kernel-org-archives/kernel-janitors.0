From: Alan Cox <alan@linux.intel.com>
Date: Fri, 15 Oct 2010 12:58:36 +0000
Subject: Re: [patch 1/2] Staging: intel_sst: return -EFAULT if
Message-Id: <20101015135836.6b83d000@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101015034407.GI6614@bicker>
In-Reply-To: <20101015034407.GI6614@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 15 Oct 2010 05:44:07 +0200
Dan Carpenter <error27@gmail.com> wrote:

> copy_to_user() returns the number of bytes remaining to be copied but
> we want to return an error code.  And that error code is -EFAULT not
> -EIO.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Alan Cox <alan@linux.intel.com>
