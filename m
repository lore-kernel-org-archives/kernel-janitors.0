From: Ian Abbott <abbotti@mev.co.uk>
Date: Tue, 17 Jan 2012 10:41:09 +0000
Subject: Re: [patch] Staging: comedi: logical || vs bitwise |
Message-Id: <4F155045.8080005@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120117073112.GC11358@elgon.mountain>
In-Reply-To: <20120117073112.GC11358@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2012-01-17 07:31, Dan Carpenter wrote:
> These are bitfields and the intend was to OR them together.  A logical
> OR here is simply 1.
>
> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>

You have my ack.  I'll just add that since the driver is incomplete, the 
buggy code is not currently reached.  (In fact, as the AI and AO 
subdevices have neither a range_table nor a range_table_list, the comedi 
core's COMEDI_INSN/COMEDI_INSNLIST ioctl handlers will return an error 
for these subdevices before it even calls the driver's insn handlers for 
these subdevices!)

Acked-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk>        )=-
-=( Tel: +44 (0)161 477 1898   FAX: +44 (0)161 718 3587         )=-
