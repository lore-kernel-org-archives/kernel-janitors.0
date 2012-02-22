From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 22 Feb 2012 22:55:31 +0000
Subject: Re: [PATCH] drivers/scsi/pm8001/pm8001_sas.c: move timer start
Message-Id: <CAA9_cmc6w_Tn+GbSubCcGxvE2w6yyDyWP_WgY3H5d6iasyqvRQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1329944133-28433-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1329944133-28433-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: jack_wang@usish.com, kernel-janitors@vger.kernel.org, lindar_liu@usish.com, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 22, 2012 at 12:55 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Move the add_timer below some instructions that do not seem to require a
> timer and that in one case can fail, thus avoiding the need for a
> corresponding del_timer.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
> I don't fully understand the code, and have not tested the change. =A0Thi=
nk
> of this patch as more of a question as to whether this is the right thing
> to do.

This patch makes sense to me... don't start the timer until we're sure
that the task is going to be submitted, or at least remember to
del_timer() before returning.

Looks like pm8001_exec_internal_tmf_task() gets this right.

--
Dan
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
