From: Jiri Slaby <jirislaby@gmail.com>
Date: Wed, 10 Dec 2008 22:01:10 +0000
Subject: Re: [PATCH 4/9] mISDN: fix sparse warnings
Message-Id: <49403C26.5050402@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <493feab4.0aaa660a.7938.3213@mx.google.com>
In-Reply-To: <493feab4.0aaa660a.7938.3213@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: Karsten Keil <kkeil@suse.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 12/10/2008 04:13 PM, Hannes Eder wrote:
> Should 'plx_lock' be declared in a header file?  Or is it really
> neccessart to export it?

As there is no other user, I vote for unexporting it.
