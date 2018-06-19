From: Steve French <smfrench@gmail.com>
Date: Tue, 19 Jun 2018 21:32:43 +0000
Subject: Re: [PATCH] cifs: Silence uninitialized variable warning
Message-Id: <CAH2r5muN9hQe8A=OaR+kophMtd7-0PT1mA1a0LwJZM9i8dkwTw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180619122530.a7b5ic6jdsl65ez5@kili.mountain>
In-Reply-To: <20180619122530.a7b5ic6jdsl65ez5@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

merged into cifs-2.6.git for-next

On Tue, Jun 19, 2018 at 8:12 AM, Paulo Alcantara <paulo@paulo.ac> wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
>
>> This is not really a runtime issue but Smatch complains that:
>>
>>     fs/cifs/smb2ops.c:1740 smb2_query_symlink()
>>     error: uninitialized symbol 'resp_buftype'.
>>
>> The warning is right that it can be uninitialized...  Also "err_buf"
>> would be NULL at this point and we're not supposed to pass NULLs to
>> free_rsp_buf() or it might trigger some extra output if we turn on
>> debugging.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Reviewed-by: Paulo Alcantara <palcantara@suse.de>
>
> Thanks
> Paulo
> --
> To unsubscribe from this list: send the line "unsubscribe linux-cifs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Thanks,

Steve
