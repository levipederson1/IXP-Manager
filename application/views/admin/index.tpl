{include file="header.tpl" pageTitle="IXP Manager :: Administrator's Home"}

<ul class="breadcrumb">
    <li class="active">
        <a href="{genUrl}">Home</a>
    </li>
</ul>

{include file="message.tpl"}
<div id="ajaxMessage"></div>

<div class="row-fluid">

<div class="span6">

    <div class="row-fluid">
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Customer Type</th>
                    <th>Count</th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$ctypes key=t item=c}
                
                    <tr>
                        <td>{Cust::$CUST_TYPES_TEXT.$t}</td>
                        <td>{$c}</td>
                    </tr>
                
                {/foreach}
            </tbody>
            
        </table>
    </div>

    <br />
    <h3>Customer Ports by Location</h3>
    
    <div class="row-fluid">
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Location</th>
                    
                    {foreach from=$speeds key=k item=i}
                        <th>{$k}</th>
                    {/foreach}
                    
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                {assign var=colcount value=0}
                {foreach from=$bylocation key=n item=spds}
                    {assign var=rowcount value=0}
                
                    <tr>
                        <td>{$n}</td>
                        {foreach from=$speeds key=k item=i}
                            <td>
                                {if isset( $spds.$k )}
                                    {$spds.$k}
                                    {assign var=rowcount value=$rowcount+$spds.$k}
                                    {else}
                                    0
                                {/if}
                            </td>
                        {/foreach}
                        <td>{$rowcount}</td>
                    </tr>
                    {assign var=colcount value=$rowcount+$colcount}
                                        
                {/foreach}
                
                <tr>
                    <td><strong>Totals</strong></td>
                    {foreach from=$speeds key=k item=i}
                        <td>
                            <strong>{$i}</strong>
                        </td>
                    {/foreach}
                    <td><strong>{$colcount}</strong></td>
                </tr>
                
            </tbody>
            
        </table>
    </div>

    <br />
    <h3>Customer Ports by Infrastructure</h3>
    
    <div class="row-fluid">
        <table class="table  table-bordered table-striped">
            <thead>
                <tr>
                    <th>Infrastructure</th>
                    
                    {foreach from=$speeds key=k item=i}
                        <th>{$k}</th>
                    {/foreach}
                    
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                {assign var=colcount value=0}
                {foreach from=$bylan key=n item=spds}
                
                    {assign var=rowcount value=0}
                
                    <tr>
                        <td>LAN #{$n}</td>
                        {foreach from=$speeds key=k item=i}
                            <td>
                                {if isset( $spds.$k )}
                                    {$spds.$k}
                                    {assign var=rowcount value=$rowcount+$spds.$k}
                                {else}
                                    0
                                {/if}
                            </td>
                        {/foreach}
                        <td>{$rowcount}</td>
                    </tr>
                    {assign var=colcount value=$rowcount+$colcount}
                {/foreach}
                
                <tr>
                    <td><strong>Totals</strong></td>
                    {foreach from=$speeds key=k item=i}
                        <td>
                            <strong>{$i}</strong>
                        </td>
                    {/foreach}
                    <td><strong>{$colcount}</strong></td>
                </tr>
                
            </tbody>
            
        </table>
    </div>


    
</div>



<div class="span6">

        {foreach from=$graphs key=k item=graph}
            <div class="row-fluid">
                <div class="well">
                    <h3>{$graphs.$k}</h3>

                    <p>
                        {genMrtgGraphBox
                            shortname='X_Peering'
                            period='month'
                            category='bits'
                            values=$stats.$k
                            graph=$k
                        }
                    </p>
                </div>
            </div>
        {/foreach}
</div>
</div>





{include file="footer.tpl"}
