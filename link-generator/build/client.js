"use strict";

var LinkA = React.createClass({
    displayName: "LinkA",

    render: function render() {
        if (!this.props.url) {
            return React.createElement(
                "div",
                { className: "row" },
                " "
            );
        }
        return React.createElement(
            "div",
            { className: "row" },
            React.createElement(
                "a",
                { className: "link", href: this.props.url },
                this.props.url.slice(0, Math.min(this.props.url.length, 12))
            )
        );
    }
});

var LinkBox = React.createClass({
    displayName: "LinkBox",

    getInitialState: function getInitialState() {
        return { href: null };
    },
    render: function render() {
        return React.createElement(
            "div",
            { className: "link-box" },
            React.createElement(
                "div",
                { className: "row" },
                " "
            ),
            React.createElement(
                "div",
                { className: "row" },
                React.createElement("input", { type: "url", ref: "url", placeholder: "URL to display", onChange: this.handleURL })
            ),
            React.createElement(
                "div",
                { className: "row" },
                " "
            ),
            React.createElement(LinkA, { url: this.state.url }),
            React.createElement(
                "div",
                { className: "rest" },
                " "
            )
        );
    },
    handleURL: function handleURL() {
        this.setState({ url: React.findDOMNode(this.refs.url).value.trim() });
        return;
    }
});
React.render(React.createElement(LinkBox, null), document.getElementById('content'));