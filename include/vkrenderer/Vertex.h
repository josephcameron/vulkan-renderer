// © 2018 Joseph Cameron - All Rights Reserved
// Created on 2018-04-16.
#ifndef VKRENDERER_VERTEX_H
#define VKRENDERER_VERTEX_H

#include <glm/glm.hpp>
#include <vulkan/vulkan.h>

#include <array>

namespace vkrenderer
{
/*!
    Vertex definition. Should be extenible. Statically via templates.
*/
struct Vertex
{
    friend bool operator==(const Vertex &a, const Vertex &b);

    glm::vec3 pos      = {};
    glm::vec3 color    = {};
    glm::vec2 texCoord = {};

    static VkVertexInputBindingDescription getBindingDescription();

    static std::array<VkVertexInputAttributeDescription, 3> getAttributeDescriptions();
};

bool operator==(const Vertex &a, const Vertex &b);
}

#endif
