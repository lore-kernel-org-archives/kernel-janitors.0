From: Pavel Begunkov <asml.silence@gmail.com>
Date: Thu, 09 Jul 2020 09:47:37 +0000
Subject: Re: [PATCH] io_uring: fix a use after free in io_async_task_func()
Message-Id: <20a7ee28-e08b-23a7-e090-da75e71b64c0@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200708184711.GA31157@mwanda>
 <58b9349b-22fd-e474-c746-2d3b542f5b23@kernel.dk>
 <66d2af76-eee0-e30d-44e5-ed70d9d808a5@gmail.com>
 <20200708195632.GW25523@casper.infradead.org>
In-Reply-To: <20200708195632.GW25523@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Matthew Wilcox <willy@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>, Dan Carpenter <dan.carpenter@oracle.com>, linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/07/2020 22:56, Matthew Wilcox wrote:
> On Wed, Jul 08, 2020 at 10:28:51PM +0300, Pavel Begunkov wrote:
>> On 08/07/2020 22:15, Jens Axboe wrote:
>>> On 7/8/20 12:47 PM, Dan Carpenter wrote:
>>>> The "apoll" variable is freed and then used on the next line.  We need
>>>> to move the free down a few lines.
>>>
>>> Thanks for spotting this Dan, applied.
>>
>> I wonder why gcc can't find it... It shouldn't be hard to do after
>> marking free-like functions with an attribute.
>>
>> Are there such tools for the kernel?
>=20
> GCC doesn't have an __attribute__((free)) yet.  Martin Sebor is working on
> it: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=87736
> also: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94527
>=20
> (I just confirmed with him on IRC that he's still working on it; it's
> part of an ongoing larger project)

Good to know. It looks broader indeed, hence won't probably be here too soo=
n.

--=20
Pavel Begunkov
