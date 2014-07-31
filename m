From: David Vrabel <david.vrabel@citrix.com>
Date: Thu, 31 Jul 2014 17:58:54 +0000
Subject: Re: [PATCH 1/4] drivers/xen/events/events_base.c: drop negativity check of unsigned parameter
Message-Id: <53DA83DE.10907@citrix.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405614350-4453-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1405614350-4453-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: wei.liu2@citrix.com, tglx@linutronix.de, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com

On 17/07/14 17:25, Andrey Utkin wrote:
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80531
> Reported-by: David Binderman <dcb314@hotmail.com>
> Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>

Applied to devel/for-linus-3.17.

Thanks.

David
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
