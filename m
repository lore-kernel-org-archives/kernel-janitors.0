From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Mon, 04 Aug 2008 13:09:32 +0000
Subject: Re: [PATCH 9/10] drivers/scsi/megaraid: Use DIV_ROUND_UP
Message-Id: <20080804140932.0167ac82@lxorguk.ukuu.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0808021715270.20095@ask.diku.dk>
	<4B6A08C587958942AA3002690DD4F8C31B0FCFA2@cosmail02.lsi.com>
In-Reply-To: <4B6A08C587958942AA3002690DD4F8C31B0FCFA2@cosmail02.lsi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Yang, Bo" <Bo.Yang@lsi.com>
Cc: Julia Lawall <julia@diku.dk>, DL-MegaRAID Linux <megaraidlinux@lsi.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "Austria, Winston" <Winston.Austria@lsi.com>, "Yuen, Eric" <Eric.Yuen@lsi.com>

On Mon, 4 Aug 2008 06:40:27 -0600
"Yang, Bo" <Bo.Yang@lsi.com> wrote:

> Julia,
> 
> Frame_count is the major parameter used by our megaraid sas FW.  It may cause some issues after this change.  Please keep the original implementation.

The two are identical code - please explain
