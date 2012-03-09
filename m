From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 09 Mar 2012 23:50:18 +0000
Subject: Re: [patch] [SCSI] mvsas: remove unused variable in mvs_task_exec()
Message-Id: <CAA9_cmfZ5qO1iaVpWNk=3qrkAznvQO3WhpG_-5+NdrZmHSABhw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120308072633.GB27713@elgon.mountain>
In-Reply-To: <20120308072633.GB27713@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, Xiangliang Yu <yuxiangl@marvell.com>, James Bottomley <James.Bottomley@suse.de>, Jack Wang <jack_wang@usish.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Mar 7, 2012 at 11:26 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We don't use "dev" any more after 07ec747a5f ("libsas: remove
> ata_port.lock management duties from lldds") and it causes a compile
> warning.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to my 'libsas' branch.  I'll carry this until James picks it up.
