From: DaeSeok Youn <daeseok.youn@gmail.com>
Date: Fri, 25 Mar 2016 09:14:58 +0000
Subject: Re: [PATCH 1/2] staging: dgnc: fix 'line over 80 characters'
Message-Id: <CAHb8M2DwNFWeTGeO7ERiJ49eeyuDZiM1rpTp1pOA40Lsp-biOw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160325024406.GA23833@SEL-JYOUN-D1>
In-Reply-To: <20160325024406.GA23833@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

2016-03-25 17:55 GMT+09:00 walter harms <wharms@bfs.de>:
>
>
> Am 25.03.2016 03:44, schrieb Daeseok Youn:
>> fix checkpatch.pl warning about 'line over 80 characters'
>> in dgnc_neo.c
>>
>> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
>> ---
>>  drivers/staging/dgnc/dgnc_neo.c | 66 +++++++++++++++++++++++++++--------------
>>  1 file changed, 44 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
>> index 31ac437..10b596f 100644
>> --- a/drivers/staging/dgnc/dgnc_neo.c
>> +++ b/drivers/staging/dgnc/dgnc_neo.c
>> @@ -77,7 +77,8 @@ struct board_ops dgnc_neo_ops = {
>>       .send_immediate_char =          neo_send_immediate_char
>>  };
>>
>> -static uint dgnc_offset_table[8] = { 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80 };
>> +static uint dgnc_offset_table[8] = { 0x01, 0x02, 0x04, 0x08,
>> +                                  0x10, 0x20, 0x40, 0x80 };
>>
>
> This table simple reads 1<<n maybe that can be replaced entierly ?
Yes, Joe already told me about this table.

Thanks.
regards,
Jake.
>
> re,
>  wh
>
>>  /*
>>   * This function allows calls to ensure that all outstanding
>> @@ -116,7 +117,8 @@ static inline void neo_set_cts_flow_control(struct channel_t *ch)
>>       writeb(efr, &ch->ch_neo_uart->efr);
>>
>>       /* Turn on table D, with 8 char hi/low watermarks */
>> -     writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_4DELAY), &ch->ch_neo_uart->fctr);
>> +     writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_4DELAY),
>> +             &ch->ch_neo_uart->fctr);
>>
>>       /* Feed the UART our trigger levels */
>>       writeb(8, &ch->ch_neo_uart->tfifo);
>> @@ -150,7 +152,8 @@ static inline void neo_set_rts_flow_control(struct channel_t *ch)
>>       /* Turn on UART enhanced bits */
>>       writeb(efr, &ch->ch_neo_uart->efr);
>>
>> -     writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_4DELAY), &ch->ch_neo_uart->fctr);
>> +     writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_4DELAY),
>> +             &ch->ch_neo_uart->fctr);
>>       ch->ch_r_watermark = 4;
>>
>>       writeb(32, &ch->ch_neo_uart->rfifo);
>> @@ -187,7 +190,8 @@ static inline void neo_set_ixon_flow_control(struct channel_t *ch)
>>       /* Turn on UART enhanced bits */
>>       writeb(efr, &ch->ch_neo_uart->efr);
>>
>> -     writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_8DELAY), &ch->ch_neo_uart->fctr);
>> +     writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_8DELAY),
>> +            &ch->ch_neo_uart->fctr);
>>       ch->ch_r_watermark = 4;
>>
>>       writeb(32, &ch->ch_neo_uart->rfifo);
>> @@ -225,7 +229,8 @@ static inline void neo_set_ixoff_flow_control(struct channel_t *ch)
>>       writeb(efr, &ch->ch_neo_uart->efr);
>>
>>       /* Turn on table D, with 8 char hi/low watermarks */
>> -     writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_8DELAY), &ch->ch_neo_uart->fctr);
>> +     writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_8DELAY),
>> +             &ch->ch_neo_uart->fctr);
>>
>>       writeb(8, &ch->ch_neo_uart->tfifo);
>>       ch->ch_t_tlevel = 8;
>> @@ -265,7 +270,8 @@ static inline void neo_set_no_input_flow_control(struct channel_t *ch)
>>       writeb(efr, &ch->ch_neo_uart->efr);
>>
>>       /* Turn on table D, with 8 char hi/low watermarks */
>> -     writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_8DELAY), &ch->ch_neo_uart->fctr);
>> +     writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_8DELAY),
>> +             &ch->ch_neo_uart->fctr);
>>
>>       ch->ch_r_watermark = 0;
>>
>> @@ -302,7 +308,8 @@ static inline void neo_set_no_output_flow_control(struct channel_t *ch)
>>       writeb(efr, &ch->ch_neo_uart->efr);
>>
>>       /* Turn on table D, with 8 char hi/low watermarks */
>> -     writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_8DELAY), &ch->ch_neo_uart->fctr);
>> +     writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_8DELAY),
>> +             &ch->ch_neo_uart->fctr);
>>
>>       ch->ch_r_watermark = 0;
>>
>> @@ -321,7 +328,8 @@ static inline void neo_set_no_output_flow_control(struct channel_t *ch)
>>  static inline void neo_set_new_start_stop_chars(struct channel_t *ch)
>>  {
>>       /* if hardware flow control is set, then skip this whole thing */
>> -     if (ch->ch_digi.digi_flags & (CTSPACE | RTSPACE) || ch->ch_c_cflag & CRTSCTS)
>> +     if (ch->ch_digi.digi_flags & (CTSPACE | RTSPACE) ||
>> +         ch->ch_c_cflag & CRTSCTS)
>>               return;
>>
>>       /* Tell UART what start/stop chars it should be looking for */
>> @@ -393,7 +401,8 @@ static inline void neo_parse_isr(struct dgnc_board *brd, uint port)
>>                       break;
>>
>>               /*
>> -              * Yank off the upper 2 bits, which just show that the FIFO's are enabled.
>> +              * Yank off the upper 2 bits,
>> +              * which just show that the FIFO's are enabled.
>>                */
>>               isr &= ~(UART_17158_IIR_FIFO_ENABLED);
>>
>> @@ -666,7 +675,8 @@ static void neo_param(struct tty_struct *tty)
>>               };
>>
>>               /* Only use the TXPrint baud rate if the terminal unit is NOT open */
>> -             if (!(ch->ch_tun.un_flags & UN_ISOPEN) && (un->un_type = DGNC_PRINT))
>> +             if (!(ch->ch_tun.un_flags & UN_ISOPEN) &&
>> +                 (un->un_type = DGNC_PRINT))
>>                       baud = C_BAUD(ch->ch_pun.un_tty) & 0xff;
>>               else
>>                       baud = C_BAUD(ch->ch_tun.un_tty) & 0xff;
>> @@ -679,7 +689,8 @@ static void neo_param(struct tty_struct *tty)
>>
>>               jindex = baud;
>>
>> -             if ((iindex >= 0) && (iindex < 4) && (jindex >= 0) && (jindex < 16))
>> +             if ((iindex >= 0) && (iindex < 4) &&
>> +                 (jindex >= 0) && (jindex < 16))
>>                       baud = bauds[iindex][jindex];
>>               else
>>                       baud = 0;
>> @@ -787,7 +798,8 @@ static void neo_param(struct tty_struct *tty)
>>               neo_set_cts_flow_control(ch);
>>       } else if (ch->ch_c_iflag & IXON) {
>>               /* If start/stop is set to disable, then we should disable flow control */
>> -             if ((ch->ch_startc = _POSIX_VDISABLE) || (ch->ch_stopc = _POSIX_VDISABLE))
>> +             if ((ch->ch_startc = _POSIX_VDISABLE) ||
>> +                 (ch->ch_stopc = _POSIX_VDISABLE))
>>                       neo_set_no_output_flow_control(ch);
>>               else
>>                       neo_set_ixon_flow_control(ch);
>> @@ -799,7 +811,8 @@ static void neo_param(struct tty_struct *tty)
>>               neo_set_rts_flow_control(ch);
>>       } else if (ch->ch_c_iflag & IXOFF) {
>>               /* If start/stop is set to disable, then we should disable flow control */
>> -             if ((ch->ch_startc = _POSIX_VDISABLE) || (ch->ch_stopc = _POSIX_VDISABLE))
>> +             if ((ch->ch_startc = _POSIX_VDISABLE) ||
>> +                 (ch->ch_stopc = _POSIX_VDISABLE))
>>                       neo_set_no_input_flow_control(ch);
>>               else
>>                       neo_set_ixoff_flow_control(ch);
>> @@ -1172,7 +1185,8 @@ static void neo_copy_data_from_uart_to_queue(struct channel_t *ch)
>>               linestatus = 0;
>>
>>               /* Copy data from uart to the queue */
>> -             memcpy_fromio(ch->ch_rqueue + head, &ch->ch_neo_uart->txrxburst, n);
>> +             memcpy_fromio(ch->ch_rqueue + head,
>> +                           &ch->ch_neo_uart->txrxburst, n);
>>
>>               /*
>>                * Since RX_FIFO_DATA_ERROR was 0, we are guaranteed
>> @@ -1225,7 +1239,8 @@ static void neo_copy_data_from_uart_to_queue(struct channel_t *ch)
>>                * we don't miss our TX FIFO emptys.
>>                */
>>               if (linestatus & (UART_LSR_THRE | UART_17158_TX_AND_FIFO_CLR)) {
>> -                     linestatus &= ~(UART_LSR_THRE | UART_17158_TX_AND_FIFO_CLR);
>> +                     linestatus &= ~(UART_LSR_THRE |
>> +                                     UART_17158_TX_AND_FIFO_CLR);
>>                       ch->ch_flags |= (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM);
>>               }
>>
>> @@ -1255,7 +1270,8 @@ static void neo_copy_data_from_uart_to_queue(struct channel_t *ch)
>>                       qleft++;
>>               }
>>
>> -             memcpy_fromio(ch->ch_rqueue + head, &ch->ch_neo_uart->txrxburst, 1);
>> +             memcpy_fromio(ch->ch_rqueue + head,
>> +                           &ch->ch_neo_uart->txrxburst, 1);
>>               ch->ch_equeue[head] = (unsigned char)linestatus;
>>
>>               /* Ditch any remaining linestatus value. */
>> @@ -1328,7 +1344,8 @@ static void neo_flush_uart_write(struct channel_t *ch)
>>       if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
>>               return;
>>
>> -     writeb((UART_FCR_ENABLE_FIFO | UART_FCR_CLEAR_XMIT), &ch->ch_neo_uart->isr_fcr);
>> +     writeb((UART_FCR_ENABLE_FIFO | UART_FCR_CLEAR_XMIT),
>> +            &ch->ch_neo_uart->isr_fcr);
>>       neo_pci_posting_flush(ch->ch_bd);
>>
>>       for (i = 0; i < 10; i++) {
>> @@ -1356,7 +1373,8 @@ static void neo_flush_uart_read(struct channel_t *ch)
>>       if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
>>               return;
>>
>> -     writeb((UART_FCR_ENABLE_FIFO | UART_FCR_CLEAR_RCVR), &ch->ch_neo_uart->isr_fcr);
>> +     writeb((UART_FCR_ENABLE_FIFO | UART_FCR_CLEAR_RCVR),
>> +            &ch->ch_neo_uart->isr_fcr);
>>       neo_pci_posting_flush(ch->ch_bd);
>>
>>       for (i = 0; i < 10; i++) {
>> @@ -1427,7 +1445,8 @@ static void neo_copy_data_from_queue_to_uart(struct channel_t *ch)
>>                               ch->ch_tun.un_flags |= (UN_EMPTY);
>>                       }
>>
>> -                     writeb(ch->ch_wqueue[ch->ch_w_tail], &ch->ch_neo_uart->txrx);
>> +                     writeb(ch->ch_wqueue[ch->ch_w_tail],
>> +                            &ch->ch_neo_uart->txrx);
>>                       ch->ch_w_tail++;
>>                       ch->ch_w_tail &= WQUEUEMASK;
>>                       ch->ch_txcount++;
>> @@ -1494,7 +1513,8 @@ static void neo_copy_data_from_queue_to_uart(struct channel_t *ch)
>>                       ch->ch_tun.un_flags |= (UN_EMPTY);
>>               }
>>
>> -             memcpy_toio(&ch->ch_neo_uart->txrxburst, ch->ch_wqueue + tail, s);
>> +             memcpy_toio(&ch->ch_neo_uart->txrxburst,
>> +                         ch->ch_wqueue + tail, s);
>>
>>               /* Add and flip queue if needed */
>>               tail = (tail + s) & WQUEUEMASK;
>> @@ -1628,7 +1648,8 @@ static void neo_uart_init(struct channel_t *ch)
>>
>>       /* Clear out UART and FIFO */
>>       readb(&ch->ch_neo_uart->txrx);
>> -     writeb((UART_FCR_ENABLE_FIFO | UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT), &ch->ch_neo_uart->isr_fcr);
>> +     writeb((UART_FCR_ENABLE_FIFO | UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT),
>> +            &ch->ch_neo_uart->isr_fcr);
>>       readb(&ch->ch_neo_uart->lsr);
>>       readb(&ch->ch_neo_uart->msr);
>>
>> @@ -1725,7 +1746,8 @@ static void neo_send_immediate_char(struct channel_t *ch, unsigned char c)
>>       neo_pci_posting_flush(ch->ch_bd);
>>  }
>>
>> -static unsigned int neo_read_eeprom(unsigned char __iomem *base, unsigned int address)
>> +static unsigned int neo_read_eeprom(unsigned char __iomem *base,
>> +                                 unsigned int address)
>>  {
>>       unsigned int enable;
>>       unsigned int bits;
