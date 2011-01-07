From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 07 Jan 2011 05:30:54 +0000
Subject: Re: [patch] vga_switcheroo: comparing too few characters in
Message-Id: <20110107053054.GA9057@p183.telecom.by>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110107051227.GD1717@bicker>
In-Reply-To: <20110107051227.GD1717@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Dave Airlie <airlied@redhat.com>, Jiri Slaby <jslaby@suse.cz>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 07, 2011 at 08:12:27AM +0300, Dan Carpenter wrote:
> This is a copy-and-paste bug.  We should be comparing 4 characters here
> instead of 3.

> --- a/drivers/gpu/vga/vga_switcheroo.c
> +++ b/drivers/gpu/vga/vga_switcheroo.c
> @@ -346,11 +346,11 @@ vga_switcheroo_debugfs_write(struct file *filp, const char __user *ubuf,
>  	if (strncmp(usercmd, "DIS", 3) = 0)
>  		client_id = VGA_SWITCHEROO_DIS;
>  
> -	if (strncmp(usercmd, "MIGD", 3) = 0) {
> +	if (strncmp(usercmd, "MIGD", 4) = 0) {
>  		just_mux = true;
>  		client_id = VGA_SWITCHEROO_IGD;
>  	}
> -	if (strncmp(usercmd, "MDIS", 3) = 0) {
> +	if (strncmp(usercmd, "MDIS", 4) = 0) {

How about you NUL-terminate, and use strcmp().
