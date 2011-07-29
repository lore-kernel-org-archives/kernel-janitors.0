From: Dan Carpenter <error27@gmail.com>
Date: Fri, 29 Jul 2011 22:55:59 +0000
Subject: Re: [patch] w1: off by one in w1_f29_remove_slave()
Message-Id: <20110729225559.GI3752@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110727095557.GL3824@shale.localdomain>
 <9C2475AA-829E-4BB8-A3D2-2444803A33D3@gmail.com>
 <CAOmT4fS1OqQb5KOOeFnGHt1tnYGBRutVrAZ4cXB6n=hou5fn8w@mail.gmail.com>
In-Reply-To: <CAOmT4fS1OqQb5KOOeFnGHt1tnYGBRutVrAZ4cXB6n=hou5fn8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bojan prtvar <prtvar.b@gmail.com>
Cc: =?iso-8859-1?Q?Jean-Fran=E7ois?= Dagenais <jeff.dagenais@gmail.com>, Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Andrew Morton <akpm@linux-foundation.org>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Jul 30, 2011 at 12:46:10AM +0200, bojan prtvar wrote:
> 
> Shouldn't it be i>=0 ?
> 

Yup...  Good eye.  Will send a v2 tomorrow.

regards,
dan carpenter

