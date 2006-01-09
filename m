From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 09 Jan 2006 15:11:10 +0000
Subject: Re: [KJ] hotplug
Message-Id: <20060109151110.GN19769@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============187618920228384=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200601091133.53146.cneira@srb.cl>
In-Reply-To: <200601091133.53146.cneira@srb.cl>
To: kernel-janitors@vger.kernel.org

--===============187618920228384==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 09, 2006 at 11:33:52AM +0000, carlos neira wrote:
> Replaced lock_kernel()  with spinlocks , compile tested ok , using it.

I can only imagine you're either doing this with a uniprocessor
kernel or don't actually have the hardware in question.

> -	lock_kernel();
> +	spin_lock(&event_thread);
>  	daemonize("cpci_hp_eventd");
> -	unlock_kernel();
> +	spin_unlock(&event_thread);

void daemonize(const char *name, ...)
{
[...]
        down(&tty_sem);
	current->signal->tty = NULL;
	up(&tty_sem);

The  first  line of  down()  is
        might_sleep();



--===============187618920228384==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============187618920228384==--
