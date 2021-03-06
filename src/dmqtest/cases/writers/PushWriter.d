/*******************************************************************************

    Writer which uses the Push request.

    Copyright:
        Copyright (c) 2015-2017 dunnhumby Germany GmbH. All rights reserved.

    License:
        Boost Software License Version 1.0. See LICENSE.txt for details.

*******************************************************************************/

module dmqtest.cases.writers.PushWriter;

/*******************************************************************************

    Imports

*******************************************************************************/

import dmqtest.cases.writers.model.IWriter;

import ocean.transition;


class PushWriter : IWriter
{
    /***************************************************************************

        Constructor.

    ***************************************************************************/

    this ( )
    {
        super("test_channel");
    }

    /***************************************************************************

        Sends `record` to the DMQ using Push.

        Params:
            record = the record to send

    ***************************************************************************/

    override protected void dmqSend ( cstring record )
    {
        assert(this.test_channels.length == 1);
        this.dmq.push(this.test_channels[0], record);
    }
}

class NeoPushWriter : IWriter
{
    /***************************************************************************

        Constructor.

    ***************************************************************************/

    this ( )
    {
        super("test_channel");
    }

    /***************************************************************************

        Sends `record` to the DMQ using Neo Push.

        Params:
            record = the record to send

    ***************************************************************************/

    override protected void dmqSend ( cstring record )
    {
        assert(this.test_channels.length == 1);
        dmq.neo.push(this.test_channels, record);
    }
}

class NeoPushMultiWriter : IWriter
{
    /***************************************************************************

        Constructor.

    ***************************************************************************/

    this ( )
    {
        super("test_channel", "test_channel2");
    }

    /***************************************************************************

        Sends `record` to the DMQ using Neo Push.

        Params:
            record = the record to send

    ***************************************************************************/

    override protected void dmqSend ( cstring record )
    {
        this.dmq.neo.push(this.test_channels, record);
    }
}
