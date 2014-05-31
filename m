From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sat, 31 May 2014 21:24:24 +0000
Subject: Re: [PATCH 1/11] USB: kl5kusb105: Remove useless return variables
Message-Id: <538A4888.1040204@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401542051-3174-1-git-send-email-peter.senna@gmail.com>	<538A46DF.1040009@cogentembedded.com> <CA+MoWDqDqwOSirh+aP72t_t_2KNajmfn8v5ywpAuLsjJssBwxw@mail.gmail.com>
In-Reply-To: <CA+MoWDqDqwOSirh+aP72t_t_2KNajmfn8v5ywpAuLsjJssBwxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Oliver Neukum <oliver@neukum.org>, kernel-janitors@vger.kernel.org, Johan Hovold <jhovold@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hello.

On 06/01/2014 01:21 AM, Peter Senna Tschudin wrote:

>>> This patch remove variables that are initialized with a constant,
>>> are never updated, and are only used as parameter of return.
>>> Return the constant instead of using a variable.

>>    The patch does more than just that, it also removes commented out code.

> That was my fault. It was fixed on V2:
> http://marc.info/?l=kernel-janitors&m0155221232137&w=2

    Yes, I forgot to look at the follow-ups before replying.

WBR, Sergei

