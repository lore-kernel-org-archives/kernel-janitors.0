From: Nick Crews <ncrews@chromium.org>
Date: Wed, 20 Feb 2019 22:04:29 +0000
Subject: Re: [bug report] platform/chrome: wilco_ec: Add support for raw commands in debugfs
Message-Id: <CAHX4x86Z9j6ZY9ssJ0_Q3vMX1_QqXHPc1muDje1gdcJrjuRhMg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190219193702.GA16050@kadam>
In-Reply-To: <20190219193702.GA16050@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Thanks Dan for checking this. I sent a patch that fixes this, subject
"[PATCH -next] platform/chrome: Fix off-by-one error in
wilco_ec/debugfs.c". You should have been CC'd.

Thanks,
Nick


On Tue, Feb 19, 2019 at 12:37 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hello Nick Crews,
>
> The patch 6d9f76dd4b35: "platform/chrome: wilco_ec: Add support for
> raw commands in debugfs" from Feb 8, 2019, leads to the following
> static checker warning:
>
>         drivers/platform/chrome/wilco_ec/debugfs.c:150 raw_write()
>         warn: 'ret - 3' negative one (off by one?)
>
> drivers/platform/chrome/wilco_ec/debugfs.c
>     119 static ssize_t raw_write(struct file *file, const char __user *user_buf,
>     120                          size_t count, loff_t *ppos)
>     121 {
>     122         char *buf = debug_info->formatted_data;
>     123         struct wilco_ec_message msg;
>     124         u8 request_data[TYPE_AND_DATA_SIZE];
>     125         ssize_t kcount;
>     126         int ret;
>     127
>     128         if (count > FORMATTED_BUFFER_SIZE)
>     129                 return -EINVAL;
>     130
>     131         kcount = simple_write_to_buffer(buf, FORMATTED_BUFFER_SIZE, ppos,
>     132                                         user_buf, count);
>     133         if (kcount < 0)
>     134                 return kcount;
>     135
>     136         ret = parse_hex_sentence(buf, kcount, request_data, TYPE_AND_DATA_SIZE);
>     137         if (ret < 0)
>     138                 return ret;
>     139         /* Need at least two bytes for message type */
>     140         if (ret < 2)
>                     ^^^^^^^
> Assume "ret = 2".
>
>     141                 return -EINVAL;
>     142
>     143         /* Clear response data buffer */
>     144         memset(debug_info->raw_data, '\0', EC_MAILBOX_DATA_SIZE_EXTENDED);
>     145
>     146         msg.type = request_data[0] << 8 | request_data[1];
>     147         msg.flags = WILCO_EC_FLAG_RAW;
>     148         msg.command = ret > 2 ? request_data[2] : 0;
>                 ^^^^^^^^^^^^^
> So command is zero.
>     149         msg.request_data = ret > 3 ? request_data + 3 : 0;
> --> 150         msg.request_size = ret - 3;
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> And request_size is u32max.
>
>     151         msg.response_data = debug_info->raw_data;
>     152         msg.response_size = EC_MAILBOX_DATA_SIZE;
>     153
>     154         /* Telemetry commands use extended response data */
>     155         if (msg.type = WILCO_EC_MSG_TELEMETRY_LONG) {
>     156                 msg.flags |= WILCO_EC_FLAG_EXTENDED_DATA;
>     157                 msg.response_size = EC_MAILBOX_DATA_SIZE_EXTENDED;
>     158         }
>     159
>     160         ret = wilco_ec_mailbox(debug_info->ec, &msg);
>                                                        ^^^^
> It leads to memory corruption when we do the memmove() in
> wilco_ec_prepare().
>
>     161         if (ret < 0)
>     162                 return ret;
>     163         debug_info->response_size = ret;
>     164
>     165         return count;
>     166 }
>
> regards,
> dan carpenter
