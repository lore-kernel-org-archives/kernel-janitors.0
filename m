From: David Teigland <teigland@redhat.com>
Date: Mon, 12 May 2008 15:21:29 +0000
Subject: Re: [PATCH] fs/dlm: section mismatch warning fix
Message-Id: <20080512152129.GB31873@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200805111915.34911.lpotenza@inwind.it>
In-Reply-To: <200805111915.34911.lpotenza@inwind.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leonardo Potenza <lpotenza@inwind.it>
Cc: kernel-janitors@vger.kernel.org, ccaulfie@redhat.com, linux-kernel@vger.kernel.org

On Sun, May 11, 2008 at 07:15:34PM +0200, Leonardo Potenza wrote:
> From: Leonardo Potenza <lpotenza@inwind.it>
> 
> Removed the section mismatch message:
> WARNING: fs/dlm/dlm.o(.init.text+0x132): Section mismatch in reference from the function init_module() to the function .exit.text:dlm_netlink_exit()
> 
> Since dlm_netlink_exit() is called in the init_dlm() error handling,
> the __exit annotation has been removed.
> 
> Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>

Thanks, I've added this to dlm.git.

Dave

