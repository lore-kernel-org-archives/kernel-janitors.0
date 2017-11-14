From: Daniel Borkmann <daniel@iogearbox.net>
Date: Tue, 14 Nov 2017 12:18:38 +0000
Subject: Re: [PATCH net-next] xdp: sample: Missing curly braces in read_route()
Message-Id: <0fb503e5-ef84-a5ba-b44e-140f11932427@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171114061202.bzxl6fhw3bdmqp7h@mwanda>
In-Reply-To: <20171114061202.bzxl6fhw3bdmqp7h@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alexei Starovoitov <ast@kernel.org>, Christina Jacob <Christina.Jacob@cavium.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/14/2017 07:12 AM, Dan Carpenter wrote:
> The assert statement is supposed to be part of the else branch but the
> curly braces were accidentally left off.
> 
> Fixes: 3e29cd0e6563 ("xdp: Sample xdp program implementing ip forward")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Daniel Borkmann <daniel@iogearbox.net>
