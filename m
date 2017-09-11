From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 11 Sep 2017 13:23:45 +0000
Subject: Re: [PATCH 2/3] [media] DaVinci-VPBE-Display: Improve a size determination in two functions
Message-Id: <CA+V-a8sS4UjeFDsGa1bvG2nyLOoNVqCBg2Q18QuD6P3mu6FHJA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e980c48c-9525-4942-a58e-20af8a96e531@users.sourceforge.net> <d4fc91b4-4850-b756-d297-fcebdc8d7131@users.sourceforge.net>
In-Reply-To: <d4fc91b4-4850-b756-d297-fcebdc8d7131@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-media <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Sep 8, 2017 at 1:32 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 8 Sep 2017 10:50:32 +0200
>
> Replace the specification of data structures by pointer dereferences
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad
