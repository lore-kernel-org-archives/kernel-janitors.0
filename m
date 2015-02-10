From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Tue, 10 Feb 2015 11:08:14 +0000
Subject: Re: [PATCH 1/1] staging: ozwpan: Move code from success handling to error handling
Message-Id: <54D9E69E.9030400@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150210104208.GA16539@sloth> <20150210110441.GH5206@mwanda>
In-Reply-To: <20150210110441.GH5206@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Shigekatsu Tateno <shigekatsu.tateno@atmel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 10/02/2015 12:04, Dan Carpenter wrote:
> On Tue, Feb 10, 2015 at 11:42:08AM +0100, Quentin Lambert wrote:
>> The original version was success handling rather than error handling,
>> therefore this patch reduces nesting.
>>
>> Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
> Fantastic.  :)  Thanks!
>
> regards,
> dan carpenter
>
I am working on a second version to highlight the dependency with
the previous patch.

I don't know where the best place to signal it is though.
Should I specify it in the comment section linking the patch
via lkml mailing list?


