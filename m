From: Matt Mackall <mpm@selenic.com>
Date: Tue, 18 Apr 2006 17:08:34 +0000
Subject: [KJ] Re: [Patch] use dynamic spinlock initialisation in
Message-Id: <20060418170834.GG15445@waste.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67161464211002042=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============67161464211002042==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 18, 2006 at 07:04:19PM +0200, Eric Sesterhenn wrote:
>  static int __init rand_initialize(void)
>  {
> +	spin_lock_init(&input_pool.lock);
> +	spin_lock_init(&blocking_pool.lock);
> +	spin_lock_init(&nonblocking_pool.lock);
>  	init_std_data(&input_pool);
>  	init_std_data(&blocking_pool);
>  	init_std_data(&nonblocking_pool);

Something about this hunk suggests a better way to do this.

-- 
Mathematics is the supreme nostalgia of our time.

--===============67161464211002042==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67161464211002042==--
