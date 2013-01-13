From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 13 Jan 2013 19:36:29 +0000
Subject: Re: [patch 2/2] staging: line6: use after free bug requesting version
Message-Id: <CAJSP0QXkBrCPViBRiWQp3wiLbNuuNZOx5j4Gz4eG8Xw7x9zjiQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121205184452.GB18227@elgon.mountain>
In-Reply-To: <20121205184452.GB18227@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Jan 13, 2013 at 7:15 PM, Markus Grabner <grabner@icg.tugraz.at> wrote:
> Considering the suggestions made so far, I came up with the following
> solution: the function "line6_send_raw_message_async" now has an additional
> argument "bool copy", which indicates whether the supplied buffer should be
> copied into a dynamically allocated block of memory. The copy flag is also
> stored in the "message" struct such that the temporary memory can be freed
> when appropriate without intervention of the caller.
>
> The patch is against linux-next since this bug should be fixed regardless of
> the status of moving the Line6 driver out of the staging area.
>
> Reported-by: Stefan Hajnoczi <stefanha@gmail.com>
> Signed-off-by: Markus Grabner <grabner@icg.tugraz.at>

Reviewed-by: Stefan Hajnoczi <stefanha@gmail.com>
