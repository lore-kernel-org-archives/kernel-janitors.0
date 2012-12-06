From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 06 Dec 2012 05:18:46 +0000
Subject: Re: [patch 1/2] staging: line6: delete an unused function
Message-Id: <CAJSP0QU91tbs1NciKJtExszbuEjUhLR_nY--1+6aKkZmKoCO+w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121205184316.GA18227@elgon.mountain>
In-Reply-To: <20121205184316.GA18227@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Markus Grabner <grabner@icg.tugraz.at>, Johannes Thumshirn <morbidrsa@googlemail.com>, devel@driverdev.osuosl.org, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Dec 5, 2012 at 7:43 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> line6_send_sysex_message_async() isn't called from anywhere.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Stefan Hajnoczi <stefanha@gmail.com>
