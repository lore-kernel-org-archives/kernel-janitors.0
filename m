From: "Gabriel L. Somlo" <somlo@cmu.edu>
Date: Tue, 20 Sep 2016 11:09:21 +0000
Subject: Re: [PATCH 0/6] firmware-qemu_fw_cfg: Fine-tuning for four function implementations
Message-Id: <20160920110920.GA14498@foober.ini.cmu.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <a736b350-a691-c73b-b8e9-67c0bffb716a@users.sourceforge.net>
In-Reply-To: <a736b350-a691-c73b-b8e9-67c0bffb716a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sun, Sep 18, 2016 at 02:48:30PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 18 Sep 2016 14:43:21 +0200
> 
> Some update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (6):
>   Use kmalloc_array() in fw_cfg_register_dir_entries()
>   Improve a size determination in fw_cfg_register_file()
>   Rename jump labels in fw_cfg_register_file()
>   Improve a size determination in fw_cfg_build_symlink()
>   Rename jump labels in fw_cfg_sysfs_probe()
>   Move a variable assignment in fw_cfg_sysfs_probe()

Acked-by: Gabriel Somlo <somlo@cmu.edu>

>  drivers/firmware/qemu_fw_cfg.c | 53 +++++++++++++++++++++---------------------
>  1 file changed, 27 insertions(+), 26 deletions(-)
> 
> -- 
> 2.10.0
> 
