From: Jon Masters <jonmasters@gmail.com>
Date: Fri, 22 Oct 2004 23:33:14 +0000
Subject: Re: [KJ] [PATCH] input/iforce-packets: insert set_current_state()
Message-Id: <35fb2e59041022163321ab05bc@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============032590702093908686=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041022232838.GD18906@us.ibm.com>
In-Reply-To: <20041022232838.GD18906@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============032590702093908686==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 22 Oct 2004 16:28:38 -0700, Nishanth Aravamudan <nacc@us.ibm.com> wrote:

> Description: Inserts set_current_state() before schedule_timeout().
> Without the insertion, schedule_timeout() will return immediately.

> @@ -293,8 +295,10 @@ int iforce_get_id_packet(struct iforce *
>                 set_current_state(TASK_INTERRUPTIBLE);
>                 add_wait_queue(&iforce->wait, &wait);
> 
> -               while (timeout && iforce->expect_packet)
> +               while (timeout && iforce->expect_packet) {
> +                       set_current_state(TASK_INTERRUPTIBLE);
>                         timeout = schedule_timeout(timeout);
> +               }
> 
>                 set_current_state(TASK_RUNNING);
>                 remove_wait_queue(&iforce->wait, &wait);

What did I miss there? Why's this second one necessary?

Jon.

--===============032590702093908686==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============032590702093908686==--
